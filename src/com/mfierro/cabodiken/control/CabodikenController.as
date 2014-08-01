package com.mfierro.cabodiken.control {
	
	import com.adobe.cairngorm.control.FrontController;
    import com.mfierro.cabodiken.commands.*;
    import com.mfierro.cabodiken.events.*;
    
	public final class CabodikenController extends FrontController {

		public function CabodikenController() {
			
			this.initialize();
			
		}
		
		private function initialize() : void {
			
			this.addCommand( LoginEvent.NAME, LoginCommand );
			this.addCommand( GetFriendsEvent.NAME, GetFriendsCommand );
			this.addCommand( GetInvitationsEvent.NAME, GetInvitationsCommand );
			this.addCommand( GetGamesEvent.NAME, GetGamesCommand );
			this.addCommand( CreateGameEvent.NAME, CreateGameCommand );
			this.addCommand( GetGameSessionEvent.NAME, GetGameSessionCommand );
			this.addCommand( SendInvitationEvent.NAME, SendInvitationCommand );
			this.addCommand( JoinGameSessionEvent.NAME, JoingGameSessionCommand);
			this.addCommand( BeginGameEvent.NAME, BeginGameCommand );
			this.addCommand( LoadResourcesEvent.NAME, LoadResourcesCommand );
			
		}
	}
}
