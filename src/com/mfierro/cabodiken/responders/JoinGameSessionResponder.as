package com.mfierro.cabodiken.responders 
{
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import mx.controls.Alert;
	import com.mfierro.cabodiken.model.CabodikenModel;
	
	public class JoinGameSessionResponder implements IResponder
	{
		
		private var model:CabodikenModel = CabodikenModel.getInstance();
		
		public function JoinGameSessionResponder() {
			
		}
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			
			if (event.result) {
				
				model.workflowState = CabodikenModel.GAME_LOBBY;
				
			} else {
				
				Alert.show("Could not connect to game session", "Error");
				model.gameSessionId = "";
				
			}
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			Alert.show("Could not connect to game session", "Error");
			model.gameSessionId = "";
			
		}
		
	}
	
}