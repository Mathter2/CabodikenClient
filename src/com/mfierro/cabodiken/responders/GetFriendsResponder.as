package com.mfierro.cabodiken.responders 
{
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	
	import mx.controls.Alert;
	
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.mfierro.cabodiken.factories.ServerDataFactory;
	public class GetFriendsResponder implements IResponder
	{
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			model.user = ServerDataFactory.buildUserData(event.result[0]);
			model.friends = ServerDataFactory.buildFriendsList( event.result );
			
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			
		}
		
	}

}