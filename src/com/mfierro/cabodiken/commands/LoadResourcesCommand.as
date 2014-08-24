package com.mfierro.cabodiken.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.mfierro.cabodiken.business.GameDelegate;
	import com.mfierro.cabodiken.events.LoadResourcesEvent;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.mfierro.cabodiken.responders.LoadResourcesResponder;

	public class LoadResourcesCommand implements ICommand {
		
		public function LoadResourcesCommand() {
			
			
			
		}
		
		public function execute( event:CairngormEvent ):void {
			
			var delegate:GameDelegate = new GameDelegate( new LoadResourcesResponder() );
			delegate.LoadGameResourcesV01();
			
		}
		
	}
}