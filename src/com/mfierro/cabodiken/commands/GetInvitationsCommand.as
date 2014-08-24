package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.LobbyDelegate;
	import com.mfierro.cabodiken.events.GetInvitationsEvent;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.GetInvitationsResponder;

	public class GetInvitationsCommand implements ICommand {
		
		public function GetInvitationsCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var delegate:LobbyDelegate = new LobbyDelegate( new GetInvitationsResponder() );
			delegate.UpdateUserInvitationsV01();
			
		}
		
	}
}