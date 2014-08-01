package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class JoinGameSessionEvent extends CairngormEvent {
		
		public static const NAME:String = "JoinGameSessionEvent";
		public var gameSessionId:String;
		
		public function JoinGameSessionEvent( gameSessionId:String ) {
			
			super(NAME);
			this.gameSessionId = gameSessionId;
			
		}
		
		override public function clone():Event {
			
			return new JoinGameSessionEvent( this.gameSessionId );
			
		}
		
	}
}