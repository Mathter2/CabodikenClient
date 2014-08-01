package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.LobbyDelegate;
	import com.mfierro.cabodiken.events.JoinGameSessionEvent;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.JoinGameSessionResponder;

	public class JoingGameSessionCommand implements ICommand {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function JoingGameSessionCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var sendEvent:JoinGameSessionEvent = event as JoinGameSessionEvent;
			var delegate:LobbyDelegate = new LobbyDelegate( new JoinGameSessionResponder() );
			model.gameSessionId = sendEvent.gameSessionId;
			delegate.JoinGameSessionV01();
			
		}
		
	}
}