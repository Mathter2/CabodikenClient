package com.mfierro.cabodiken.business {
	
	import com.mfierro.cabodiken.vo.ObjectData;
	import com.mfierro.cabodiken.vo.UserData;
	import mx.rpc.Responder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.adobe.cairngorm.business.ServiceLocator;
	
	public class LobbyDelegate {
		
		private var responder : IResponder;
		private var service : Object;
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function LobbyDelegate( responder:IResponder ) {
			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getWebService( "WebServiceLobby" );
			
		}
		
		public function UpdateUserInvitationsV01() : void {
			
			callWebService( service.UpdateUserInvitationsV01( model.sessionTokenId ) );
			
		}
		
		public function GetObjectsV01( type:String ) : void {
			
			callWebService( service.GetObjectsV01( model.sessionTokenId, type ) );
			
		}
		
		public function CreateGameSessionV01( game:ObjectData ) : void {
			
			callWebService( service.CreateGameSessionV01( model.sessionTokenId, game.id, game.name ) );
			
		}
		
		public function UpdateGameSessionV01() : void {
			
			callWebService( service.UpdateGameSessionV01( model.sessionTokenId, model.gameSessionId ) );
			
		}
		
		public function SendUserInvitationV01( friend:UserData ) : void {
			
			callWebService( service.SendUserInvitationV01( model.sessionTokenId, model.gameSessionId, friend.name, friend.host ) );
			
		}
		
		public function JoinGameSessionV01() : void {
			
			callWebService( service.JoinGameSessionV01( model.sessionTokenId, model.gameSessionId ) );
			
		}
		
		public function BeginGameV01() : void {
			
			callWebService( service.BeginGameV01( model.sessionTokenId, model.gameSessionId ) );
			
		}
		
		private function callWebService ( service : AsyncToken  ) : void {
			
			var callResponder:Responder = new Responder( onResult, onFault );
			service.addResponder( callResponder );
			
		}
		
		protected function onResult( e:ResultEvent  ) : void {
			
			trace("RESULT");
			responder.result( new ResultEvent (ResultEvent.RESULT, false, true, e.result ) );
			
		}
		
		protected function onFault( e:FaultEvent ):void {
			
			trace("[Delegate] - onFault");
			
		}
		
	}

}