package com.mfierro.cabodiken.model 
{
	import mx.collections.ArrayCollection;
	/**
	 * ...
	 * @author Matías Fierro
	 */
	public class Action 
	{
		
		public var name:String;
		public var imageURL:String;
		public var objectId:int;
		public var parameters:ArrayCollection = new ArrayCollection();
		
		public function Action( name:String, imageURL:String, objectId:int, parameters:ArrayCollection ) {
			
			this.name = name;
			this.imageURL = imageURL;
			this.objectId = objectId;
			this.parameters = parameters;
			
		}
		
	}

}