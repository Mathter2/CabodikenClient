package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.GameDelegate;
	import com.mfierro.cabodiken.events.GetActionsEvent;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.GetActionsResponder;

	public class GetActionsCommand implements ICommand {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function GetActionsCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var getActionsEvent:GetActionsEvent= event as GetActionsEvent;
			var delegate:GameDelegate = new GameDelegate( new GetActionsResponder() );
			delegate.GetActionsV01();
			
		}
		
	}
}