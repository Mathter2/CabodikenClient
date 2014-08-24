package com.mfierro.cabodiken.model 
{
	import com.mfierro.cabodiken.events.ExecuteActionEvent;
	import com.mfierro.cabodiken.vo.CardData;
	import com.mfierro.cabodiken.vo.DeckData;
	import com.mfierro.cabodiken.vo.LocationData;
	import com.mfierro.cabodiken.vo.ResourceLibrary;
	import com.mfierro.cabodiken.factories.ActionFactory;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.controls.Text;
	import mx.core.DragSource;
	import mx.effects.Rotate;
	import mx.managers.DragManager;
	import mx.core.UIComponent;
	import com.mfierro.cabodiken.view.controls.HandArea;
	import com.mfierro.cabodiken.view.controls.PlayArea;
	import com.mfierro.cabodiken.view.controls.RadialMenu;
	import mx.events.DragEvent;
	
	[Bindable]
	public class Deck extends GameObject implements IContainer, IFlippable {
		
		public var cards:ArrayCollection = new ArrayCollection();
		public var isFaceDown:Boolean = true;
		
		public function Deck( id:int, resourceId:int, name:String, location:LocationData, 
				rotation:int, isLocked:Boolean ) {
			
			super( id, resourceId, name, location, rotation,isLocked );
			
		}
		
		public override function draw() : UIComponent {
			
			var resources:ResourceLibrary = CabodikenModel.getInstance().resources;
			var deck:DeckData = resources.decks[resourceId];
			var topCard:CardData;
			var topCardImage:String;
			var topCardControl:Image;
			var canvas:Canvas = new Canvas();
			
			if (isFaceDown) {
				
				if ( cards.length > 0 ) {
					
					topCard = deck.cards[Number(cards.getItemAt(cards.length - 1))];
					topCardImage = topCard.backImage;
					
				}
				
			} else {
				
				if ( cards.length > 0 ) {
					
					topCard = deck.cards[ Number( cards.getItemAt(0) ) ];
					topCardImage = topCard.frontImage;
					
				}
				
			}
			
			for (var i:int = 0; i < cards.length; i++) {
				
				var card:Image = new Image();

				card.load(topCardImage);
				topCardControl = card;

				card.y = ( cards.length - i - 1 ) * 2;
				card.x = i;
				canvas.addChild(card);
			
			}
			
			if (isLocked) {
				
				topCardControl.addEventListener( MouseEvent.CLICK, cardClick );
				topCardControl.addEventListener( MouseEvent.MOUSE_MOVE, cardMouseMove );
				
			} else {
				
				canvas.useHandCursor = false;
				canvas.buttonMode = true;
				canvas.mouseChildren = false;

				canvas.addEventListener( MouseEvent.CLICK, deckClick );
				canvas.addEventListener( MouseEvent.MOUSE_MOVE, deckMouseMove );
				
			}
			
			canvas.addEventListener( DragEvent.DRAG_ENTER, dragEnter );
			canvas.addEventListener( DragEvent.DRAG_DROP, dragDrop );
			
			canvas.x = location.x;
			canvas.y = location.y;
			
			canvas.clipContent = false;
			
			return canvas;

		}
		
		public override function executeMove( type:String, source:UIComponent, target:UIComponent, x:int, y:int ) : void {
			
			var areaId:int;
			
			if (target is PlayArea) {
				
				areaId = (target as PlayArea).area.areaId;
				
			} else if (target is Canvas && target.parent && target.parent is HandArea) {
				
				areaId = (target.parent as HandArea).area.areaId;
				
			}
			
			if ( type == "DECK") {
			
				if (source.parent == target) {
					
					var moveParameters:ArrayCollection = new ArrayCollection ( [ x, y ] );
					var moveAction:ExecuteActionEvent = new ExecuteActionEvent("MOVE", id, moveParameters);
					moveAction.dispatch();
					
				} else if (target is PlayArea) {
					
					//Placeholder for AREA_MOVE through player areas
					
				}

			} else if ( type == "DECK_CARD" ) {
				
				var targetArea:PlayArea = (target as PlayArea);
				var drawParameters:ArrayCollection = new ArrayCollection( [ x, y, areaId ] );
				var drawAction:ExecuteActionEvent = new ExecuteActionEvent("DRAW", id, drawParameters);
				drawAction.dispatch();
				
			}
			
		}
		
		public function reorder( contents:ArrayCollection ) : void {
			
			cards = contents;
			
		}
		
		public function flip( isFaceDown:Boolean ) : void {
			
			this.isFaceDown = isFaceDown;
			
		}
		
		override public function clone():GameObject {
			
			var clone:Deck = new Deck(id, resourceId, name, location, rotation, isLocked );
			
			clone.isFaceDown = isFaceDown;
			clone.cards = cards;
			
			return clone;
			
		}
		
		private function cardMouseMove( event:MouseEvent ) : void {
            
            var target:UIComponent = event.currentTarget as UIComponent;
            
            var objectType:String = "DECK_CARD";
			var x:int = target.contentMouseX;
			var y:int = target.contentMouseY;
			var dragSource:DragSource = new DragSource();
            
			dragSource.addData(objectType, "type");
			dragSource.addData(this, "object");
			dragSource.addData(x, "x");
			dragSource.addData(y, "y");

    		DragManager.doDrag(target, dragSource, event);
        }
		
		private function deckMouseMove( event:MouseEvent ) : void {
			
			var target:UIComponent = event.currentTarget as UIComponent;
			
			var objectType:String = "DECK";
			var x:int = target.contentMouseX;
			var y:int = target.contentMouseY;
			var dragSource:DragSource = new DragSource();
			
			dragSource.addData(objectType, "type");
			dragSource.addData(this, "object");
			dragSource.addData(x, "x");
			dragSource.addData(y, "y");
			
			DragManager.doDrag(target, dragSource, event);
			
		}
		
		private function deckClick( event:MouseEvent ) : void {
			
			var deck:Canvas = event.target as Canvas;
			var area:PlayArea = deck.parent as PlayArea;
			showRadialMenu( area );
			
		}
		
		private function cardClick( event:MouseEvent ) : void {
			
			var deck:Canvas = event.currentTarget.parent as Canvas;
			var area:UIComponent = deck.parent as UIComponent;
			showRadialMenu( area );
			
		}
		
		private function dragEnter( event:DragEvent ) : void {
			
			var dragSource:DragSource = event.dragSource;
			
			if (dragSource.hasFormat("type") && dragSource.hasFormat("object") && dragSource.hasFormat("x") && 
				dragSource.hasFormat("y") && dragSource.dataForFormat("type") == "CARD" ) {

				var target:UIComponent = event.currentTarget as UIComponent;
				
				DragManager.acceptDragDrop(target);
				DragManager.showFeedback(DragManager.COPY);
			}
			
		}
		
		private function dragDrop( event:DragEvent ) : void {
			
			var containable:IContainable = event.dragSource.dataForFormat("object") as IContainable;
			containable.aggregate( id );
			
		}
		
		private function showRadialMenu( area:UIComponent ) : void {
			
			var radialMenu:RadialMenu = new RadialMenu();
			var actions:ArrayCollection = new ArrayCollection(); //ActionFactory.buildActions( id, "LOCK", "SHUFFLE");
			actions.addItem( ActionFactory.buildAction( id, "LOCK", !isLocked ) );
			actions.addItem( ActionFactory.buildAction( id, "FLIP", !isFaceDown ) );
			actions.addItem( ActionFactory.buildAction( id, "SHUFFLE", 0 ) );
			radialMenu.actions = actions;
			radialMenu.area = area;
			radialMenu.show();
			
		}
		
	}	

}