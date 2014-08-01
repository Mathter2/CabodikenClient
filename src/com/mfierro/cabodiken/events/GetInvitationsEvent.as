package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class GetInvitationsEvent extends CairngormEvent {
		
		public static const NAME:String = "GetInvitationsEvent";
		public var sessiontokenId:String = "";
		
		public function GetInvitationsEvent( sessiontokenId:String ) {
			
			super(NAME);
			this.sessiontokenId = sessiontokenId;
			
		}
		
		override public function clone():Event {
			
			return new GetInvitationsEvent ( this.sessiontokenId );
			
		}
		
	}
}