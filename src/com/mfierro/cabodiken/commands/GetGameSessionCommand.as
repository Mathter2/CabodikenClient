package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.business.LobbyDelegate;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.mfierro.cabodiken.responders.GetGameSessionResponder;

	public class GetGameSessionCommand implements ICommand {
		
		private var model:CabodikenModel = CabodikenModel.getInstance();
		
		public function GetGameSessionCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var delegate:LobbyDelegate = new LobbyDelegate( new GetGameSessionResponder() );
			delegate.UpdateGameSessionV01();
			
		}
		
	}
}