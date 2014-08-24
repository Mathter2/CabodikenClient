package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.GameDelegate;
	import com.mfierro.cabodiken.events.GetActionsEvent;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.GetActionsResponder;

	public class GetActionsCommand implements ICommand {
		
		public function GetActionsCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var delegate:GameDelegate = new GameDelegate( new GetActionsResponder() );
			delegate.GetActionsV01();
			
		}
		
	}
}