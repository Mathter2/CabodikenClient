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
    
	public final class CabodikenModel implements IModelLocator {

		private static var instance:CabodikenModel;

		public function CabodikenModel(access:SingletonEnforcer) {
			
			if (access == null) {
			    throw new CairngormError( CairngormMessageCodes.SINGLETON_EXCEPTION, "ModelLocator" );
			}
			
			instance = this;
			
			//this.user = new UserData(5, "Mathter", 1, "", true);//REMOVE!
			
		}
		 
		public static function getInstance() : CabodikenModel {
			
			if (instance == null) {
				instance = new CabodikenModel( new SingletonEnforcer() );
			}
			return instance;
			
		}
		
		/*
		*	Variables
		*/
		
		[Bindable]
		public var workflowState:uint = CabodikenModel.LOGIN_FORM;
		[Bindable]
		public var sessionTokenId:String = "";
		[Bindable]
		public var user:UserData;
		[Bindable]
		public var friends:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var invitations:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var games:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var gameSessionId:String = "";
		[Bindable]
		public var gameSession:GameSessionData;
		[Bindable]
		public var objectPositioner:ObjectPositionerFactory;
		[Bindable]
		public var resources:ResourceLibrary;
		[Bindable]
		public var lastActionId:int = 0;
		[Bindable]
		public var gameObjectCollection:GameObjectCollection = new GameObjectCollection();
		[Bindable]
		public var hands:Dictionary = new Dictionary();
		//[Bindable]
		//public var gameObjects:Dictionary = new Dictionary();
		
		public static const LOGIN_FORM:uint = 0;
		public static const LOBBY:uint = 1;
		public static const GAME_LOBBY:uint = 2;
		public static const GAME:uint = 3;
		public static const EDITOR:uint = 4;
		
		public var image:String = "";
	}
}

class SingletonEnforcer {}
