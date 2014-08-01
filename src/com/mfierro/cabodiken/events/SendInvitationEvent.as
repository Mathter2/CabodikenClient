package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.vo.ObjectData;
	import com.mfierro.cabodiken.vo.UserData;
	import flash.events.Event;
	
	public class SendInvitationEvent extends CairngormEvent {
		
		public static const NAME:String = "SendInvitationEvent";
		public var friend:UserData;
		public var game:ObjectData;
		
		public function SendInvitationEvent( friend:UserData, game:ObjectData ) {
			
			super(NAME);
			this.friend = friend;
			this.game = game;
			
		}
		
		override public function clone():Event {
			
			return new SendInvitationEvent( this.friend, this.game );
			
		}
		
	}
}