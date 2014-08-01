package com.mfierro.cabodiken.vo {
	
	public class ObjectData {
		
		public var id : int;
		[Bindable]
		public var name : String;
		public var type : String;
		
		public function ObjectData( id:int , name:String, type:String ) {
			
			this.id = id;
			this.name = name;
			this.type = type;
			
		}
		
		public function toString() : String {
			
			return name;
			
		}
		
	}
}