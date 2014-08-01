package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.vo.ObjectData;
	import flash.events.Event;
	
	public class CreateGameEvent extends CairngormEvent {
		
		public static const NAME:String = "CreateGameEvent";
		public var game:ObjectData;
		
		public function CreateGameEvent( game:ObjectData) {
			
			super(NAME);
			this.game = game;
			
		}
		
		override public function clone():Event {
			
			return new CreateGameEvent( game );
			
		}
		
	}
}