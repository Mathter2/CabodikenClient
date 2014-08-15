package com.mfierro.cabodiken.responders 
{
	import com.mfierro.cabodiken.vo.ObjectData;
	import com.mfierro.cabodiken.vo.UserData;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	
	import mx.controls.Alert;
	
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.mfierro.cabodiken.factories.ServerDataFactory;
	
	public class ExecuteActionResponder implements IResponder
	{
		
		private var model:ModelLocator = ModelLocator.getInstance();
		private var friend:UserData;
		private var game:ObjectData;
		
		public function ExecuteActionResponder() {
			
		}
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			
			if ( event.result ) {
				
				trace("[ExecuteActionResponder] Execution completed");
				
			} else {
				
				trace("[ExecuteActionResponder] Execution failed!");
				
			}
			
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			Alert.show("Could not send invitation to " + friend.name, "Invitation failed");
			
		}
		
	}
	
}