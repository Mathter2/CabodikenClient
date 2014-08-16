package com.mfierro.cabodiken.factories {
	import com.adobe.serialization.json.JSONDecoder;
	import com.mfierro.cabodiken.model.Action;
	import mx.collections.ArrayCollection;	
	
	public class ActionFactory {
		
		public static function buildAction ( objectId:int, actionName:String, ... parameters ) : Action {
			
			var parameterCollection:ArrayCollection = new ArrayCollection(parameters);
			
			switch (actionName.toUpperCase()) 
			{
				case "LOCK":
					return buildLockAction( objectId, parameterCollection );
				case "SHUFFLE":
					return buildShuffleAction( objectId, parameterCollection );
				case "FLIP":
					return buildFlipAction( objectId, parameterCollection );
				default:
					return null;
			}
			
		}
		
		private static function buildLockAction( objectId:int, parameters:ArrayCollection ) : Action {
			
			return new Action( "LOCK", "res/actions/Lock.png", objectId, parameters );
			
		}
		
		private static function buildShuffleAction( objectId:int, parameters:ArrayCollection ) : Action {
			
			return new Action( "SHUFFLE", "res/actions/Shuffle.png", objectId, parameters );	
			
		}
		
		private static function buildFlipAction( objectId:int, parameters:ArrayCollection ) : Action {
			
			return new Action( "FLIP", "res/actions/Flip.png", objectId, parameters );
			
		}
		
	}
}