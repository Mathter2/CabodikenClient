package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class GetActionsEvent extends CairngormEvent {
		
		public static const NAME:String = "GetActionsEvent";
		
		public function GetActionsEvent() {
			
			super(NAME);
			
		}
		
		override public function clone():Event {
			
			return new GetActionsEvent();
			
		}
		
	}
}