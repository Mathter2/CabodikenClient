package com.mfierro.cabodiken.vo {
	import mx.collections.ArrayCollection;
	
	public class GameSessionData {
		
        public var game:ObjectData;
        public var gameSessionId:String;
		public var isGameStarted:Boolean;
		[Bindable]
        public var players:ArrayCollection;
		
		public function GameSessionData( game:ObjectData, gameSessionId:String, isGameStarted:Boolean, players:ArrayCollection ) {
			
			this.game = game;
			this.gameSessionId = gameSessionId;
			this.players = players;
			this.isGameStarted = isGameStarted;
			
		}
		
	}
}