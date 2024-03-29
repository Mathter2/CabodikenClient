package com.mfierro.cabodiken.responders 
{
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	
	import mx.controls.Alert;
	
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.mfierro.cabodiken.factories.ServerDataFactory;
	public class GetGamesResponder implements IResponder
	{
		
		private var model:CabodikenModel = CabodikenModel.getInstance();
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			model.games = ServerDataFactory.buildObjectDataList( event.result );
			
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			
		}
		
	}

}