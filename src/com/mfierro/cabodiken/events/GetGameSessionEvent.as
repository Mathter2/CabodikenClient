package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class GetGameSessionEvent extends CairngormEvent {
		
		public static const NAME:String = "GetGameSessionEvent";
		
		public function GetGameSessionEvent(  ) {
			
			super(NAME);
			
		}
		
		override public function clone():Event {
			
			return new GetGameSessionEvent();
			
		}
		
	}
}