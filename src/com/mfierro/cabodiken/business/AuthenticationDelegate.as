package com.mfierro.cabodiken.business {
	
	import mx.rpc.Responder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.adobe.cairngorm.business.ServiceLocator;
	
	public class AuthenticationDelegate {
		
		private var responder : IResponder;
		private var service : Object;
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function AuthenticationDelegate( responder:IResponder ) {
			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getWebService( "WebServiceAuthentication" );
			
		}
		
		public function userAuthenticateV01( username:String, password:String ) : void {
			
			callWebService( service.UserAuthenticateV01( username, 1, password ) );
			
		}
		
		public function getFriendsListV01() : void {
			
			callWebService( service.GetFriendsListV01( model.sessionTokenId ) );
			
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