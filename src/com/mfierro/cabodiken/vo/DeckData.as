package com.mfierro.cabodiken.vo {
	import flash.utils.Dictionary;
	import mx.collections.ArrayCollection;
	
	public class DeckData extends ObjectData{
		
        public var cards:Dictionary = new Dictionary();
		
		public function DeckData( id:int, name:String, cards:ArrayCollection ) {
			
			super(id, name, "DECK");
			for each (var card:CardData in cards) 
			{
				this.cards[card.id] = card;
			}
			
		}
		
	}
	
}