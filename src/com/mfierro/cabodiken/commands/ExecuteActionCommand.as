package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.mfierro.cabodiken.business.GameDelegate;
	import com.mfierro.cabodiken.events.ExecuteActionEvent;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.ExecuteActionResponder;
	import mx.collections.ArrayCollection;

	public class ExecuteActionCommand implements ICommand {
		
		public function ExecuteActionCommand() {

		}
		
		public function execute( event:CairngormEvent ):void {
			
			var sendEvent:ExecuteActionEvent = event as ExecuteActionEvent;
			var delegate:GameDelegate = new GameDelegate( new ExecuteActionResponder() );
			var parameters:ArrayCollection = new ArrayCollection();
			parameters.addItem( sendEvent.objectId.toString() );
			parameters.addAll( sendEvent.parameters );
			delegate.ExecuteActionV01( sendEvent.actionName, parameters );
			
		}
		
	}
}