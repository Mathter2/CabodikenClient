package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.LobbyDelegate;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.events.BeginGameEvent;
	import com.mfierro.cabodiken.responders.BeginGameResponder;

	public class BeginGameCommand implements ICommand {
		
		public function BeginGameCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var createGameEvent:BeginGameEvent = event as BeginGameEvent;
			var delegate:LobbyDelegate = new LobbyDelegate( new BeginGameResponder() );
			delegate.BeginGameV01();
			
		}
		
	}
}