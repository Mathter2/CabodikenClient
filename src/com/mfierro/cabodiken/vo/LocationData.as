package com.mfierro.cabodiken.vo {
	
	public class LocationData {
		
        public var x:int;
		public var y:int;
		public var z:int;
		public var areaId:int
		
		public function LocationData( x:int, y:int, z:int, areaId:int ) {
			
			this.x = x;
			this.y = y;
			this.z = z;
			this.areaId = areaId;
			
		}
		
	}
}