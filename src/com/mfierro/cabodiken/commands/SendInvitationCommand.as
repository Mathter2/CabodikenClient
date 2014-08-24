package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.LobbyDelegate;
	import com.mfierro.cabodiken.events.SendInvitationEvent;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.SendInvitationResponder;

	public class SendInvitationCommand implements ICommand {
		
		public function SendInvitationCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var sendEvent:SendInvitationEvent = event as SendInvitationEvent;
			var delegate:LobbyDelegate = new LobbyDelegate( new SendInvitationResponder( sendEvent.friend, sendEvent.game ) );
			delegate.SendUserInvitationV01( sendEvent.friend );
			
		}
		
	}
}