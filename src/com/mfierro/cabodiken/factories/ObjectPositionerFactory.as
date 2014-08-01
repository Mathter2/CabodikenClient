package com.mfierro.cabodiken.factories 
{
	import com.mfierro.cabodiken.vo.LocationData;
	
	public class ObjectPositionerFactory 
	{
		public var playerNumber:uint;

		public function ObjectPositionerFactory( playerNumber:uint ) {
			
			this.playerNumber = playerNumber;
			
		}
		
		public function getAreaLocation( areaId:uint ) : LocationData{
			
			return new LocationData(0, 0, 0);
			
		}
		
	}

}