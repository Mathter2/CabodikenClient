package com.mfierro.cabodiken.model 
{
	import com.mfierro.cabodiken.factories.ActionFactory;
	import com.mfierro.cabodiken.events.ExecuteActionEvent;
	import com.mfierro.cabodiken.view.controls.RadialMenu;
	import com.mfierro.cabodiken.view.controls.PlayArea;
	import com.mfierro.cabodiken.view.controls.HandArea;
	import com.mfierro.cabodiken.vo.CardData;
	import com.mfierro.cabodiken.vo.LocationData;
	import com.mfierro.cabodiken.vo.ResourceLibrary;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.core.DragSource;
	import mx.core.UIComponent;
	import mx.managers.DragManager;
	
	[Bindable]
	public class Card extends GameObject implements IFlippable, IContainable {
		
		public var isFaceDown:Boolean = false;
		
		public function Card( id:int, resourceId:int, name:String, location:LocationData, 
				rotation:int, isLocked:Boolean )	{
		
			super( id, resourceId, name, location, rotation, isLocked );
			
		}
		
		override public function draw():UIComponent {
			
			var resources:ResourceLibrary = CabodikenModel.getInstance().resources;
			var card:CardData = resources.cards[resourceId] as CardData;
			var image:Image = new Image();
			
			if (isFaceDown) {
				
				image.load(card.backImage);
				
			} else {
				
				image.load(card.frontImage);
				
			}
			
			image.addEventListener( MouseEvent.CLICK, cardClick );
			
			if (!isLocked) {
				
				image.addEventListener( MouseEvent.MOUSE_MOVE, cardMouseMove );
				
			} 
			
			image.x = location.x;
			image.y = location.y;
			
			return image;
			
		}
		
		override public function executeMove(type:String, source:UIComponent, target:UIComponent, x:int, y:int) : void {
			
			var parameters:ArrayCollection;
			var moveAction:ExecuteActionEvent;
			
			if (source.parent == target) {
			
				parameters = new ArrayCollection( [ x, y ] );
				moveAction = new ExecuteActionEvent("MOVE", id, parameters);
			
			} else {
				
				if ( target is PlayArea ) {
					
					parameters =  new ArrayCollection( [ x, y, (target as PlayArea).area.areaId ] );
					
				} else if ( target is Canvas ) {
					
					parameters =  new ArrayCollection( [ x, y, (target.parent as HandArea).area.areaId ] );
					
				}
				
				moveAction = new ExecuteActionEvent("AREA_MOVE", id, parameters);
				
			}
			
			moveAction.dispatch();
			
		}
		
		override public function clone():GameObject {
			
			var clone:Card = new Card(id, resourceId, name, location, rotation, isLocked );
			
			clone.isFaceDown = isFaceDown;
			
			return clone;
			
		}
		
		public function flip( isFaceDown:Boolean ) : void {
			
			this.isFaceDown = isFaceDown;
			
		}
		
		public function aggregate( targetId:int ):void {
			
			var parameters:ArrayCollection = new ArrayCollection( [ targetId ] );
			var aggregateEvent:ExecuteActionEvent = new ExecuteActionEvent( "AGGREGATE", id, parameters );
			aggregateEvent.dispatch();
			
		}
		
		private function cardClick( event:MouseEvent ) : void {
			
			var card:Image = event.currentTarget as Image;
			var area:UIComponent = card.parent as UIComponent;
			showRadialMenu( area );
			
		}
		
		private function cardMouseMove( event:MouseEvent ) : void {
            
            var target:UIComponent = event.currentTarget as UIComponent;
            
            var objectType:String = "CARD";
			var x:int = target.contentMouseX;
			var y:int = target.contentMouseY;
			var dragSource:DragSource = new DragSource();
            
			dragSource.addData(objectType, "type");
			dragSource.addData(this, "object");
			dragSource.addData(x, "x");
			dragSource.addData(y, "y");

    		DragManager.doDrag(target, dragSource, event);
        }
		
		private function showRadialMenu( area:UIComponent ) : void {
			
			var radialMenu:RadialMenu = new RadialMenu();
			var actions:ArrayCollection = new ArrayCollection();
			actions.addItem( ActionFactory.buildAction( id, "LOCK", !isLocked ) );
			actions.addItem( ActionFactory.buildAction( id, "FLIP", !isFaceDown ) );
			radialMenu.actions = actions;
			radialMenu.area = area;
			radialMenu.show();
			
		}
		
	}

}