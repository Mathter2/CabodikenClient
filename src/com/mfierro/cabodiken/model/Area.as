package com.mfierro.cabodiken.model {
	
	import com.mfierro.cabodiken.vo.UserData;
	import flash.utils.Dictionary;
	import mx.collections.ArrayCollection;

	[Bindable]
	public class Area {
		
		public var areaId:int;
		public var owner:UserData;
		
		public function Area( areaId:int, owner:UserData ) {
			
			this.areaId = areaId;
			this.owner = owner;
			
		}
		
	}

}