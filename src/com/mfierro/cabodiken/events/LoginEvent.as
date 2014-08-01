package com.mfierro.cabodiken.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.Event;
	
	public class LoginEvent extends CairngormEvent {
		
		public static const NAME:String = "LoginEvent";
		public var username:String = "";
		public var password:String = "";
		
		public function LoginEvent( username:String, password:String ) {
			
			super(NAME);
			this.username = username;
			this.password = password;
			
		}
		
		override public function clone():Event {
			
			return new LoginEvent(this.username, this.password);
			
		}
		
	}
}