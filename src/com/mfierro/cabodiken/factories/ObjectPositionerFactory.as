package com.mfierro.cabodiken.factories 
{
	import com.mfierro.cabodiken.vo.LocationData;
	
	public class ObjectPositionerFactory 
	{
		public var playerNumber:uint;

		public function ObjectPositionerFactory( playerNumber:uint ) {
			
			this.playerNumber = playerNumber;
			
		}
		
		public function getAreaLocation( globalLocation:LocationData, targetWidth:int, targetHeight:int, 
				parentWidth:int, parentHeight:int ) : LocationData {
			
			switch ( playerNumber ) {
				
				case 2:
				case 6:
					return getFrontLocation( globalLocation, targetWidth, targetHeight, parentWidth, parentHeight );
				case 3:
				case 7:
					return getRightLocation( globalLocation, targetWidth, targetHeight, parentWidth, parentHeight );
				case 4:
				case 8:
					return getLeftLocation( globalLocation, targetWidth, targetHeight, parentWidth, parentHeight );
				default:
					return globalLocation;
					
			}
			
		}
		
		public function getAreaRotation( globalRotation:int ) : int {
			
			switch ( playerNumber ) {
				
				case 2:
				case 6:
					return getFrontRotation( globalRotation );
				case 3:
				case 7:
					return getRightRotation( globalRotation );
				case 4:
				case 8:
					return getLeftRotation( globalRotation );
				default:
					return globalRotation;
					
			}
			
		}
		
		private function getFrontLocation( globalLocation:LocationData, targetWidth:int, targetHeight:int, 
				parentWidth:int, parentHeight:int ) : LocationData {
			
			var newX:int = parentWidth - targetWidth - globalLocation.x;
			var newY:int = parentHeight - targetHeight - globalLocation.y;
			
			return new LocationData( newX, newY, globalLocation.z, globalLocation.areaId );
			
		}
		
		private function getRightLocation( globalLocation:LocationData, targetWidth:int, targetHeight:int, 
				parentWidth:int, parentHeight:int ) : LocationData {
			
			return globalLocation;
			
		}
		
		private function getLeftLocation( globalLocation:LocationData, targetWidth:int, targetHeight:int, 
				parentWidth:int, parentHeight:int ) : LocationData {
			
			return globalLocation;
			
		}
		
		private function getFrontRotation( globalRotation:int ) : int {
			
			return globalRotation + 180;
			
		}
		
		private function getRightRotation( globalRotation:int ) : int {
			
			return globalRotation + 90;
			
		}
		
		private function getLeftRotation( globalRotation:int ) : int {
			
			return globalRotation + 270;
			
		}
		
		
	}

}