package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.AuthenticationDelegate;
	import com.mfierro.cabodiken.events.LoginEvent;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.LoginResponder;

	public class LoginCommand implements ICommand {
		
		public function LoginCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var loginEvent:LoginEvent = event as LoginEvent; 
			var delegate:AuthenticationDelegate = new AuthenticationDelegate( new LoginResponder() );
			
			delegate.userAuthenticateV01( loginEvent.username, loginEvent.password );
			
		}
		
	}
}