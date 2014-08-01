package com.mfierro.cabodiken.vo {
	import mx.collections.ArrayCollection;
	
	public class CardData extends ObjectData{
		
        public var backImage:String;
		public var frontImage:String;
		
		public function CardData( id:int, name:String, backImage:String, frontImage:String ) {
			
			super(id, name, "CARD");
			this.backImage = backImage;
			this.frontImage = frontImage;
			
		}
		
	}
}