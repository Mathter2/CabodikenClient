package com.mfierro.cabodiken.model 
{
	import flash.utils.Dictionary;
	import mx.collections.ArrayCollection;

	[Bindable]
	public class Area 
	{
		
		public var _objects:Dictionary = new Dictionary();
		public var areaId:int;
		
		public function Area( areaId:int ) 
		{
			
			this.areaId = areaId;
			
		}
		
		public function getObjects() : ArrayCollection {
			
			var objects:ArrayCollection = new ArrayCollection();
			for each (var value:Object in _objects) {
				
				objects.addItem(value);
				
			}
			return objects;
			
		}
		
		public function addObject( gameObject:GameObject ) : void {
			
			_objects[gameObject.id] = gameObject;
			
		}
		
		public function findObject ( id:int ) : GameObject {
			
			return _objects[id];
			
		}
		
	}

}