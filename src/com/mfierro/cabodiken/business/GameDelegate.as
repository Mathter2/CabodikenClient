package com.mfierro.cabodiken.business {
	
	import mx.collections.ArrayCollection;
	import mx.rpc.Responder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.adobe.cairngorm.business.ServiceLocator;
	
	public class GameDelegate {
		
		private var responder : IResponder;
		private var service : Object;
		private var model:CabodikenModel = CabodikenModel.getInstance();
		
		public function GameDelegate( responder:IResponder ) {
			
			this.responder = responder;
			this.service = ServiceLocator.getInstance().getWebService( "WebServiceGame" );
			
		}
		
		public function LoadGameResourcesV01() : void {
			
			callWebService( service.LoadGameResourcesV01( model.sessionTokenId, model.gameSessionId ) );
			
		}
		
		public function GetActionsV01() : void {
			
			callWebService( service.GetActionsV01( model.sessionTokenId, model.gameSessionId, model.lastActionId ) )
			
		}
		
		public function ExecuteActionV01( actionName:String, parameters:ArrayCollection ) : void {
			
			callWebService ( service.ExecuteActionV01( model.sessionTokenId, model.gameSessionId, model.lastActionId, 
													   actionName, parameters ) ) ;
			
		}
		
		private function callWebService ( service : AsyncToken  ) : void {
			
			var callResponder:Responder = new Responder( onResult, onFault );
			service.addResponder( callResponder );
			
		}
		
		protected function onResult( e:ResultEvent  ) : void {
			
			responder.result( new ResultEvent (ResultEvent.RESULT, false, true, e.result ) );
			
		}
		
		protected function onFault( e:FaultEvent ):void {
			
			trace("[Delegate] - onFault");
			
		}
		
	}

}