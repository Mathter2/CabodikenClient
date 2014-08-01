package com.mfierro.cabodiken.responders 
{
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.mfierro.cabodiken.factories.ServerDataFactory;
	
	public class CreateGameResponder implements IResponder
	{
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			model.gameSessionId = event.result as String;
			model.workflowState = ModelLocator.GAME_LOBBY;
			
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			
		}
		
	}

}