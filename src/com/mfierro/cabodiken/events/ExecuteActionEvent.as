package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	import mx.collections.ArrayCollection;
	
	public class ExecuteActionEvent extends CairngormEvent {
		
		public static const NAME:String = "ExecuteActionEvent";
		public var actionName:String;
		public var objectId:int;
		public var parameters:ArrayCollection = new ArrayCollection;
		
		public function ExecuteActionEvent( actionName:String, objectId:int, parameters:ArrayCollection ) {
			
			super(NAME);
			this.actionName = actionName;
			this.objectId = objectId;
			this.parameters = parameters;
			
		}
		
		override public function clone():Event {
			
			return new ExecuteActionEvent( this.actionName, this.objectId, this.parameters );
			
		}
		
	}
}