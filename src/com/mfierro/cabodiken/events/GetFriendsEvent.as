package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class GetFriendsEvent extends CairngormEvent {
		
		public static const NAME:String = "GetFriendsEvent";
		public var sessiontokenId:String = "";
		
		public function GetFriendsEvent( sessiontokenId:String ) {
			
			super(NAME);
			this.sessiontokenId = sessiontokenId;
			
		}
		
		override public function clone():Event {
			
			return new GetFriendsEvent( this.sessiontokenId );
			
		}
		
	}
}