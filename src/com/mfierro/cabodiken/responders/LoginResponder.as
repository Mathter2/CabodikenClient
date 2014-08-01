package com.mfierro.cabodiken.responders 
{
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import com.mfierro.cabodiken.model.ModelLocator;
	import mx.controls.Alert;

	public class LoginResponder implements IResponder
	{
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			var sessionTokenId:String = event.result as String;
			
			if (sessionTokenId) {
				
				model.sessionTokenId = sessionTokenId;
				model.workflowState = ModelLocator.LOBBY;
				
			} else {
				
				Alert.show("The user/password combination is invalid. Please try again.", "Access denied");
				
			}
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			
		}
		
	}

}