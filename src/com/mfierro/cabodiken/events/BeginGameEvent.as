package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class BeginGameEvent extends CairngormEvent {
		
		public static const NAME:String = "BeginGameEvent";
		
		public function BeginGameEvent() {
			
			super(NAME);
			
		}
		
		override public function clone():Event {
			
			return new BeginGameEvent();
			
		}
		
	}
}