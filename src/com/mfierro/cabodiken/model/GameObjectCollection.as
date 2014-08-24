package com.mfierro.cabodiken.model 
{
	import flash.utils.Dictionary;
	import mx.collections.ArrayCollection;
	/**
	 * ...
	 * @author Matías Fierro
	 */
	public class GameObjectCollection 
	{
		
		private var _objects:Dictionary = new Dictionary();
		private var _objectsInArea:Dictionary = new Dictionary();
		private var _removed:Dictionary = new Dictionary();
		
		public function getObjects() : ArrayCollection {
			
			var objects:ArrayCollection = new ArrayCollection();
			
			for each (var value:GameObject in _objects) {
				
				objects.addItem(value);
				
			}
			
			return objects;
			
		}
		
		public function getObjectsByArea( areaId:int ) : ArrayCollection {
			
			var objects:ArrayCollection = new ArrayCollection();
			
			for each (var value:GameObject in _objectsInArea[areaId]) {
				
				objects.addItem(value);
				
			}
			
			return objects;
			
		}
		
		public function getRemovedObjects( areaId:int ) : ArrayCollection {
			
			var objects:ArrayCollection = new ArrayCollection();
			
			for each ( var value:GameObject in _removed[areaId] ) {
				
				objects.addItem( value );
				
			}
			
			return objects;
			
		}
		
		public function addObject( gameObject:GameObject ) : void {
			
			_objects[gameObject.id] = gameObject;
			if (! _objectsInArea[gameObject.location.areaId]) {
				
				_objectsInArea[gameObject.location.areaId] = new ArrayCollection();
				
			}
			
			(_objectsInArea[gameObject.location.areaId] as ArrayCollection).addItem(gameObject);
			
		}
		
		public function findObject ( id:int ) : GameObject {
			
			return _objects[id];
			
		}
		
		public function removeObject ( id:int ) : void {
			
			var objectAreaId:int = (_objects[id] as GameObject).location.areaId
			var areaObjects:ArrayCollection;
			var removedObject:GameObject;
			
			if ( ! _removed[objectAreaId] ) {
				
				_removed[objectAreaId] = new ArrayCollection();
				
			}
			
			(_removed[objectAreaId] as ArrayCollection).addItem(_objects[id]);
			
			removedObject = _objects[id];
			
			areaObjects = _objectsInArea[objectAreaId] as ArrayCollection;
			
			areaObjects.removeItemAt( areaObjects.getItemIndex( removedObject ) );
			
			delete _objects[id];
			
		}
		
		public function commitRemove( areaId:int, gameObject:GameObject ) : void {
			
			var removedObjects:ArrayCollection = _removed[areaId] as ArrayCollection
			removedObjects.removeItemAt( removedObjects.getItemIndex( gameObject ) );
			
		}
		
	}

}