package com.mfierro.cabodiken.vo {
	import mx.collections.ArrayCollection;
	
	public class DeckData extends ObjectData{
		
        public var cards:ArrayCollection;
		
		public function DeckData( id:int, name:String, cards:ArrayCollection ) {
			
			super(id, name, "DECK");
			this.cards = cards;
			
		}
		
	}
}