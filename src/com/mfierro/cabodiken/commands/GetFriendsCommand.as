package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.AuthenticationDelegate;
	import com.mfierro.cabodiken.events.GetFriendsEvent;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.GetFriendsResponder;

	public class GetFriendsCommand implements ICommand {
		
		private var model:CabodikenModel = CabodikenModel.getInstance();
		
		public function GetFriendsCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var delegate:AuthenticationDelegate = new AuthenticationDelegate( new GetFriendsResponder() );
			delegate.getFriendsListV01();
			
		}
		
	}
}