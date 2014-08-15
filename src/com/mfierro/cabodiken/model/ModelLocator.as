package com.mfierro.cabodiken.model {
	
	import adobe.utils.CustomActions;
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
	import com.adobe.cairngorm.model.IModelLocator;
	import com.mfierro.cabodiken.factories.ObjectPositionerFactory;
	import com.mfierro.cabodiken.vo.GameSessionData;
	import com.mfierro.cabodiken.vo.ResourceLibrary;
	import com.mfierro.cabodiken.vo.UserData;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
    
    [Bindable]
	public final class ModelLocator implements IModelLocator {

		private static var instance:ModelLocator;

		public function ModelLocator(access:SingletonEnforcer) {
			
			if (access == null) {
			    throw new CairngormError( CairngormMessageCodes.SINGLETON_EXCEPTION, "ModelLocator" );
			}
			
			instance = this;
			
			//this.user = new UserData(5, "Mathter", 1, "", true);//REMOVE!
			
		}
		 
		public static function getInstance() : ModelLocator {
			
			if (instance == null) {
				instance = new ModelLocator( new SingletonEnforcer() );
			}
			return instance;
			
		}
		
		/*
		*	Variables
		*/
		
		public var workflowState:uint = ModelLocator.LOGIN_FORM; //CHANGE!!!
				
		//public var sessionTokenId:String = "gxb1O3aMChiU77WXnnheF635IKwJltJd51w3IXfMLBo7pxFpNtT5F6TtVtJaZi56"; //CHAGE!!!
		public var sessionTokenId:String = ""; //CHAGE!!!
		public var user:UserData;
		public var friends:ArrayCollection = new ArrayCollection();
		public var invitations:ArrayCollection = new ArrayCollection();
		public var games:ArrayCollection = new ArrayCollection();
		//public var gameSessionId:String = "Lt21N88FxgZ6v4vwVcM!Xby8OOIfMaIYj5dwPSnCcIO6wamOwnKTH15TaXsooSb2";
		public var gameSessionId:String = "";
		public var gameSession:GameSessionData;
		public var objectPositioner:ObjectPositionerFactory;
		public var resources:ResourceLibrary;
		public var lastActionId:int = 0;
		public var table:Area = new Area(0);
		//public var decks:ArrayCollection = new ArrayCollection();
		public var gameObjects:Dictionary = new Dictionary();
		
		public static const LOGIN_FORM:uint = 0;
		public static const LOBBY:uint = 1;
		public static const GAME_LOBBY:uint = 2;
		public static const GAME:uint = 3;
		public static const EDITOR:uint = 4;
		
		public var image:String = "";
	}
}

class SingletonEnforcer {}
