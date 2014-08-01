package com.mfierro.cabodiken.vo {
	
	public class InvitationData {
		
		public var sender : UserData;
		public var gameSessionId : String;
		public var name : String;
		
		public function InvitationData( sender:UserData, gameSessionId:String, name:String ) {
			
			this.sender = sender;
			this.gameSessionId = gameSessionId;
			this.name = name;
			
		}
		
		public function getText() : String {
			
			return sender.name + " has invited you to play " + name;
			
		}
	}
}