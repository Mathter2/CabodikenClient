package com.mfierro.cabodiken.model 
{
	import com.mfierro.cabodiken.vo.LocationData;
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
		
		public function GameObject( id:int, resourceId:int, name:String, rotation:int = 0, 
									x:int = 0, y:int = 0, z:int = 0, isLocked:Boolean = false ) {
			
			this.id = id;
			this.resourceId = resourceId;
			this.name = name;
			this.rotation = rotation;
			this.location = new LocationData(x, y, z);
			this.isLocked = isLocked;
			
		}
		
		public function draw() : UIComponent {
			
			throw new Error(
				"Child class didn't override method draw(). Please report this as a bug. resourceId= " + resourceId + " name=" + name);
			
		}
		
		public function executeMove( source:UIComponent, target:UIComponent, x:int, y:int ) : void {
			
			throw new Error( "Child class didn't override method executeMove(). Please report this as a bug. resourceId= " 
				+ resourceId + " name=" + name);
			
		}
		
		public function clone() : GameObject {
			
			return new GameObject(id, resourceId, name, rotation, location.x, location.y, location.z , isLocked);
			
		}
		
	}

}