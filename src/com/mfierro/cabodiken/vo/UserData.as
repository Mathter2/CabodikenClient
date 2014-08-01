package com.mfierro.cabodiken.vo {
	import mx.core.IUID;
	
	[Bindable]
	public class UserData {
		
		public var id:int;
		public var name:String;
		public var host:int;
		public var message:String;
		public var isOnline:Boolean;
		
		public function UserData( id:int, name:String, host:int, message:String, isOnline:Boolean ) {
		
			this.id = id;
			this.name = name;
			this.host = host;
			this.message = message;
			this.isOnline = isOnline;
			
		}
	}
}