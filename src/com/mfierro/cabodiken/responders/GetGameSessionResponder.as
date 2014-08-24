package com.mfierro.cabodiken.responders 
{
	import com.mfierro.cabodiken.factories.ObjectPositionerFactory;
	import com.mfierro.cabodiken.model.Area;
	import com.mfierro.cabodiken.vo.PlayerData;
	import com.mfierro.cabodiken.vo.UserData;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	
	import mx.controls.Alert;
	
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.mfierro.cabodiken.factories.ServerDataFactory;
	
	public class GetGameSessionResponder implements IResponder
	{
		
		public function result( e:Object ):void {
			
			var model:CabodikenModel = CabodikenModel.getInstance();
			var event:ResultEvent = e as ResultEvent;
			model.gameSession = ServerDataFactory.buildGameSession( event.result );
			
			if ( model.gameSessionId ) {
				
				if ( model.gameSession && model.gameSession.isGameStarted) {
					
					model.workflowState = CabodikenModel.GAME;
					
				}
				
			}
			
			for each (var player:PlayerData in model.gameSession.players) {
				
				model.hands[player.number] = new Area( player.number, new UserData( player.id, player.name, player.host, player.message, player.isOnline ) );
				if ( player.id == model.user.id ) {
					
					model.objectPositioner = new ObjectPositionerFactory( player.number );
					
				}
				
			}
		
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			
		}
		
	}

}