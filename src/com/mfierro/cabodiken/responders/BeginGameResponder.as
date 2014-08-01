package com.mfierro.cabodiken.responders 
{
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import mx.controls.Alert;
	
	public class BeginGameResponder implements IResponder
	{
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			if ( !event.result ) 
			{
				Alert.show( "Could not start game", "Error" );
			}
			
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			
		}
		
	}

}