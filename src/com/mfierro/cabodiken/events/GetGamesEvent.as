package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class GetGamesEvent extends CairngormEvent {
		
		public static const NAME:String = "GetGamesEvent";
		public var sessiontokenId:String = "";
		
		public function GetGamesEvent( sessiontokenId:String ) {
			
			super(NAME);
			this.sessiontokenId = sessiontokenId;
			
		}
		
		override public function clone():Event {
			
			return new GetFriendsEvent( this.sessiontokenId );
			
		}
		
	}
}