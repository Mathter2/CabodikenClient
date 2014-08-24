package com.mfierro.cabodiken.responders 
{
	import com.mfierro.cabodiken.vo.ObjectData;
	import com.mfierro.cabodiken.vo.UserData;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	
	import mx.controls.Alert;
	
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.mfierro.cabodiken.factories.ServerDataFactory;
	
	public class SendInvitationResponder implements IResponder
	{
		
		private var friend:UserData;
		private var game:ObjectData;
		
		public function SendInvitationResponder( friend:UserData, game:ObjectData ) {
			
			this.friend = friend;
			this.game = game;
			
		}
		
		public function result( e:Object ):void {
			
			//var event:ResultEvent = e as ResultEvent;
			Alert.show("You just invited " + friend.name + " to play " + game.name, "Invitation Sent");
			
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			Alert.show("Could not send invitation to " + friend.name, "Invitation failed");
			
		}
		
	}
	
}