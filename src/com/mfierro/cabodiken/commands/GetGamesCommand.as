package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.business.LobbyDelegate;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.mfierro.cabodiken.responders.GetGamesResponder;

	public class GetGamesCommand implements ICommand {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function GetGamesCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var delegate:LobbyDelegate = new LobbyDelegate( new GetGamesResponder() );
			delegate.GetObjectsV01( "GAME" );
			
		}
		
	}
}