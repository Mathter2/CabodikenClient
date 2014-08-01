package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.LobbyDelegate;
	import com.mfierro.cabodiken.events.CreateGameEvent;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.CreateGameResponder;

	public class CreateGameCommand implements ICommand {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function CreateGameCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var createGameEvent:CreateGameEvent = event as CreateGameEvent;
			var delegate:LobbyDelegate = new LobbyDelegate( new CreateGameResponder() );
			delegate.CreateGameSessionV01( createGameEvent.game );
			
		}
		
	}
}