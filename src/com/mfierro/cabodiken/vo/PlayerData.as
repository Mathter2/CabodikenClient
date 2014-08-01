package com.mfierro.cabodiken.vo {
	
	import mx.collections.ArrayCollection;
	import mx.core.IUID;
	
	[Bindable]
	public class PlayerData extends UserData {
		
		public var customDices:ArrayCollection;
        public var customDecks:ArrayCollection;
        public var customTokens:ArrayCollection;
        public var place:uint;
        public var number:uint;
        public var isHandLocked:Boolean = true;
        public var isAreaLocked:Boolean = true;
		
		public function PlayerData( user:UserData, customDices:ArrayCollection, customDecks:ArrayCollection, 
								    customTokens:ArrayCollection, place:uint, number:uint ) {
		
			super( user.id, user.name, user.host, user.message, user.isOnline );
			this.customDices = customDices;
			this.customDecks = customDecks;
			this.customTokens = customTokens;
			this.place = place;
			this.number = number;
			
		}
		
	}
}