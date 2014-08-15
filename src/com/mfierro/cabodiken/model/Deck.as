package com.mfierro.cabodiken.model 
{
	import com.mfierro.cabodiken.events.ExecuteActionEvent;
	import com.mfierro.cabodiken.vo.CardData;
	import com.mfierro.cabodiken.vo.DeckData;
	import com.mfierro.cabodiken.vo.ResourceLibrary;
	import com.mfierro.cabodiken.factories.ActionFactory;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.controls.Text;
	import mx.core.DragSource;
	import mx.managers.DragManager;
	import mx.core.UIComponent;
	import com.mfierro.cabodiken.view.controls.PlayArea;
	import com.mfierro.cabodiken.view.controls.RadialMenu;
	import mx.events.DragEvent;
	
	[Bindable]
	public class Deck extends GameObject implements IContainer{
		
		private var _cards:ArrayCollection = new ArrayCollection();
		public var isFaceDown:Boolean = true;
		
		public function Deck( id:int, resourceId:int, name:String ) {
			
			super(id, resourceId, name);
			
		}
		
		public function getCards() : ArrayCollection {
			
			return _cards;
			
		}
		
		public function addCard( cardId:int ) : void {
			
			_cards.addItem(cardId);
			
		}
		
		public function addCards( cards:ArrayCollection ) : void {
			
			_cards.addAll(cards);
			
		}
		
		public function reorder( contents:ArrayCollection ) : void {
			
			_cards = contents;
			
		}
		
		
		public override function draw() : UIComponent {
			
			var resources:ResourceLibrary = ModelLocator.getInstance().resources;
			var deck:DeckData = resources.decks[resourceId];
			var topCard:CardData;
			var topCardImage:String;
			var topCardControl:Image;
			var topCardId:int;
			var cardBellowImage:String;
			var canvas:Canvas = new Canvas();
			
			if (isFaceDown) {
				
				if (_cards.length > 0) {
					
					topCard = deck.cards[Number(_cards.getItemAt(_cards.length - 1))];
					topCardImage = topCard.backImage;
					
					if (_cards.length > 1) {
						
						cardBellowImage = deck.cards[Number(_cards.getItemAt(_cards.length - 2))].backImage;
						
					}
					
				}
				
			} else {
				
				if (_cards.length > 0) {
					
					topCard = deck.cards[Number(_cards.getItemAt(0))];
					topCardImage = topCard.frontImage;
					
					if (_cards.length > 1) {
						
						cardBellowImage = deck.cards[Number(_cards.getItemAt(1))].frontImage;
						
					}
					
				}
				
			}
			
			for (var i:int = 0; i < _cards.length; i++) {
				
				var card:Image = new Image();
				if (i == _cards.length - 1) {
					
					card.load(topCardImage);
					topCardControl = card;
					
				} else {
					
					card.load(cardBellowImage);
					
				}
				card.top = (_cards.length - i - 1) * 2;
				card.left = i;
				canvas.addChild(card);
			
			}
			
			if (isLocked) {
				
				topCardControl.addEventListener(MouseEvent.MOUSE_MOVE, cardMouseMove);
				topCardControl.addEventListener(DragEvent.DRAG_COMPLETE, cardDragComplete);
				canvas.addEventListener(DragEvent.DRAG_ENTER, dragEnter);
				//topCardControl.addEventListener(MouseEvent.MOUSE_DOWN, cardMouseDown);
				//topCardControl.addEventListener(MouseEvent.MOUSE_UP, cardMouseUp);
				
				
			} else {
				
				canvas.useHandCursor = false;
				canvas.buttonMode = true;
				canvas.mouseChildren = false;
				
				//canvas.addEventListener(MouseEvent.MOUSE_DOWN, dragStart);
				//canvas.addEventListener(MouseEvent.MOUSE_UP, dragStop);
				canvas.addEventListener(MouseEvent.CLICK, deckClick);
				canvas.addEventListener(MouseEvent.MOUSE_MOVE, deckMouseMove);
				canvas.addEventListener(DragEvent.DRAG_DROP, deckDragDrop);
				
			}
			
			canvas.x = location.x;
			canvas.y = location.y;
			
			return canvas;

		}
		
		public override function executeMove( type:String, source:UIComponent, target:UIComponent, x:int, y:int ) : void {
			
			if ( type == "DECK") {
			
				if (source.parent == target) {
					
					var parameters:ArrayCollection = new ArrayCollection ( [ x, y ] );
					var moveAction:ExecuteActionEvent = new ExecuteActionEvent("MOVE", id, parameters);
					moveAction.dispatch();
					
				} else if (target is PlayArea) {
					
					
					
				}

			} else if ( type == "DECK_CARD" ) {
				
				var parameters:ArrayCollection = new ArrayCollection( [ x, y ] );
				var drawAction:ExecuteActionEvent = new ExecuteActionEvent("DRAW", id, parameters);
				moveAction.dispatch();
				
			}
			
		}
		
		private function deckDragDrop( event:DragEvent ) : void {
			
			var deck:Canvas = event.currentTarget as Canvas;
			var area:PlayArea = deck.parent as PlayArea;
			
			if (event.relatedObject == area) 
			{
				var parameters:ArrayCollection = new ArrayCollection ( [ event.localX, event.localY ] );
				var moveAction:ExecuteActionEvent = new ExecuteActionEvent("MOVE", id, parameters);
				moveAction.dispatch();
			}
			
		}
		
		private function cardDragComplete( event:DragEvent ) : void {
			
			event.preventDefault();
			
		}
		
		private function dragEnter( event:DragEvent ) : void {
				
			// Accept the drag only if the user is dragging data 
			// identified by the 'color' format value.
			if (event.dragSource.hasFormat("type") && event.dragSource.hasFormat("id") ) {

				// Get the drop target component from the event object.
				var target:UIComponent = event.currentTarget as UIComponent;
				// Accept the drop.
				//DragManager.acceptDragDrop(target);
				DragManager.acceptDragDrop(target);
			}
			
		}
		
		private function dragDrop( event:DragEvent ) : void {
			
			
			
		}
		
		
		private function dragStart(event : MouseEvent) : void {
			
			var target:UIComponent = event.currentTarget as UIComponent;
			target.startDrag(false, new Rectangle(0, 0, target.parent.width - target.width, target.parent.height - target.height));
				
		}
		
		private function dragStop(event : MouseEvent) : void {
			
			var deck:Canvas = event.target as Canvas;
			var area:PlayArea = deck.parent as PlayArea;
			var locationX:int = area.mouseX - event.localX;
			var locationY:int = area.mouseY - event.localY;
			
			deck.stopDrag();
			
			if (location.x == locationX && location.y == locationY) {
				
				showRadialMenu( area );
				
			} else if ( area.mouseX < area.width && area.mouseY < area.height && area.mouseX > 0 && area.mouseY > 0 ) {
				
				var parameters:ArrayCollection = new ArrayCollection();
				var executeAction:ExecuteActionEvent;
				
				parameters.addItem(locationX.toString());
				parameters.addItem(locationY.toString());
				executeAction = new ExecuteActionEvent("Move", id, parameters);
				executeAction.dispatch();
				
			}
			
		}
		
		private function cardMouseMove( event:MouseEvent ) : void {
            
            var target:UIComponent = event.currentTarget as UIComponent;
            
            // Get the color of the drag initiator component.
            var objectType:String = "DECK_CARD";
			var objectId:int = id;

            // Create a DragSource object.
            var dragSource:DragSource = new DragSource();

            // Add the data to the object.
			dragSource.addData(objectType, "type");
			dragSource.addData(objectId, "id");

            // Call the DragManager doDrag() method to start the drag. 
    		DragManager.doDrag(target, dragSource, event);
        }
		
		private function deckMouseMove( event:MouseEvent ) : void {
			
			var target:UIComponent = event.currentTarget as UIComponent;
			
			var objectType:String = "DECK";
			var dragSource:DragSource = new DragSource();
			var x:int = target.contentMouseX;
			var y:int = target.contentMouseY;
			
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
		
		private function cardMouseDown( event:MouseEvent ) : void {
			
			var target:UIComponent = event.currentTarget as UIComponent;
			target.startDrag();
			
		}
		
		private function cardMouseUp( event:MouseEvent ) : void {
			
			var card:Image = event.currentTarget as Image;
			card.stopDrag();
			
		}
		
		private function cardoldfunc( event:DragEvent ) : void {
			
			var card:Image = event.currentTarget as Image;
			var area:PlayArea = card.parent.parent as PlayArea;
			var locationX:int = area.mouseX - event.localX;
			var locationY:int = area.mouseY - event.localY;
			
			if (card.x == _cards.length - 1 && card.y == 0) {
				
				showRadialMenu( area );
				
			} else if ( area.mouseX < area.width && area.mouseY < area.height && area.mouseX > 0 && area.mouseY > 0 ) {
				
				//var target = event.relatedObject;
				
			}
			
		}
		
		private function showRadialMenu( area:PlayArea ) : void {
			
			var radialMenu:RadialMenu = new RadialMenu();
			var actions:ArrayCollection = new ArrayCollection(); //ActionFactory.buildActions( id, "LOCK", "SHUFFLE");
			actions.addItem( ActionFactory.buildAction( id, "LOCK", !isLocked ) );
			actions.addItem( ActionFactory.buildAction( id, "SHUFFLE", 0 ) );
			radialMenu.actions = actions;
			radialMenu.area = area;
			radialMenu.show();
			
		}
		
	}	

}