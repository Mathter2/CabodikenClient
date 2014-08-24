package com.mfierro.cabodiken.model 
{
	import com.mfierro.cabodiken.vo.LocationData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.core.UIComponent;
	/**
	 * ...
	 * @author Matías Fierro
	 */
	[Bindable]
	public class GameObject implements IDrawable {
		
		public var id:int;
		public var resourceId:int;
		public var name:String;
		public var rotation:int;
		public var location:LocationData;;
		public var isLocked:Boolean;
		
		public function GameObject( id:int, resourceId:int, name:String, location:LocationData, 
				rotation:int , isLocked:Boolean ) {
			
			this.id = id;
			this.resourceId = resourceId;
			this.name = name;
			this.rotation = rotation;
			this.location = location;
			this.isLocked = isLocked;
			
		}
		
		public function draw() : UIComponent {
			
			throw new Error(
				"Child class didn't override method draw(). Please report this as a bug. resourceId= " + resourceId + " name=" + name);
			
		}
		
		public function executeMove( type:String, source:UIComponent, target:UIComponent, x:int, y:int ) : void {
			
			throw new Error( "Child class didn't override method executeMove(). Please report this as a bug. resourceId= " 
				+ resourceId + " name=" + name);
			
		}
		
		public function clone() : GameObject {
			
			throw new Error( "Child class didn't override method clone(). Please report this as a bug. resourceId= " 
				+ resourceId + " name=" + name);
			
		}
		
	}

}