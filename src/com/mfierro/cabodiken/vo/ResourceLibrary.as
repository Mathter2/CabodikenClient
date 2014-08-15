package com.mfierro.cabodiken.vo {
	import flash.utils.Dictionary;
	import mx.collections.ArrayCollection;
	
	public class ResourceLibrary {
		
        public var boards:Dictionary = new Dictionary();
		public var decks:Dictionary = new Dictionary();
		public var dices:Dictionary = new Dictionary();
		public var tokens:Dictionary = new Dictionary();
		
		public function ResourceLibrary( boards:ArrayCollection, decks:ArrayCollection, dices:ArrayCollection, tokens:ArrayCollection ) {
			
			for each (var deck:DeckData in decks) 
			{
				this.decks[deck.id] = deck;
			}
			
		}
		
	}
}