package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class LoadResourcesEvent extends CairngormEvent {
		
		public static const NAME:String = "LoadResourcesEvent";
		
		public function LoadResourcesEvent() {
			
			super(NAME);
			
		}
		
		override public function clone():Event {
			
			return new LoadResourcesEvent();
			
		}
		
	}
}