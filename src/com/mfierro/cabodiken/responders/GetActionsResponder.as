package com.mfierro.cabodiken.responders 
{
	import com.mfierro.cabodiken.model.Area;
	import com.mfierro.cabodiken.model.Card;
	import com.mfierro.cabodiken.model.Deck;
	import com.mfierro.cabodiken.model.GameObject;
	import com.mfierro.cabodiken.model.IContainer;
	import com.mfierro.cabodiken.model.IFlippable;
	import com.mfierro.cabodiken.model.ModelLocator;
	import com.mfierro.cabodiken.vo.LocationData;
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import mx.controls.Alert;
	
	public class GetActionsResponder implements IResponder {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			if ( event.result.length > 0 ) 
			{
				for each (var action:Object in event.result) 
				{
					switch (action.Name) 
					{
						case "CREATE_DECK":
							createDeck(action.Parameters);
							break;
						case "CREATE_CARD":
							createCard(action.Parameters);
							break;
						case "MOVE":
							move(action.Parameters);
							break;
						case "REORDER":
							reorder(action.Parameters);
							break;
						case "LOCK":
							lock(action.Parameters);
							break;
						case "FLIP":
							flip(action.Parameters);
							break;
						default:
						Alert.show("Cannot find action: " + action.Name, "Internal Error");
					}
				}
				model.lastActionId += event.result.length;
			}
			
		}
		
		public function fault( e:Object ):void {
			
			trace("[Responder] - fault");
			
		}
		
		private function createDeck( parameters:ArrayCollection ) : void {

			var deck:Deck;
			var id:int = Number(parameters.getItemAt(0));
			var resourceId:int = Number(parameters.getItemAt(1));
			var rotation:int = Number(parameters.getItemAt(2));
			var location:LocationData = getLocationData(parameters.getItemAt(3) as String);
			var isLocked:Boolean = (parameters.getItemAt(4) as String).toLowerCase() == "true";
			var isFaceDown:Boolean = (parameters.getItemAt(5) as String).toLowerCase() == "true";
			var cardsString:String = parameters.getItemAt(6) as String;
			var cards:ArrayCollection = new ArrayCollection();
			
			for each (var cardId:String in cardsString.split(";")) {
				
				cards.addItem(Number(cardId));
				
			}
			
			deck = new Deck(id, resourceId, "");
			deck.rotation = rotation;
			deck.location = location;
			deck.isFaceDown = isFaceDown;
			deck.isLocked = isLocked;
			deck.cards = cards;
			model.table.addObject(deck);
			
		}
		
		private function createCard( parameters:ArrayCollection ) : void {

			var card:Card;
			var id:int = Number(parameters.getItemAt(0));
			var resourceId:int = Number(parameters.getItemAt(1));
			var rotation:int = Number(parameters.getItemAt(2));
			var location:LocationData = getLocationData(parameters.getItemAt(3) as String);
			var isLocked:Boolean = (parameters.getItemAt(4) as String).toLowerCase() == "true";
			var isFaceDown:Boolean = (parameters.getItemAt(5) as String).toLowerCase() == "true";
			
			card = new Card(id, resourceId, "");
			card.rotation = rotation;
			card.location = location;
			card.isFaceDown = isFaceDown;
			card.isLocked = isLocked;
			model.table.addObject(card);
			
		}
		
		private function move( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var location:LocationData = getLocationData(parameters[1] as String);
			var gameObject:GameObject = model.table.findObject(id);
			gameObject.location = location;
			
		}
		
		private function reorder( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var contents:ArrayCollection = getContents(parameters[1]);
			var container:IContainer = model.table.findObject(id) as IContainer;
			container.reorder(contents);
			
		}
		
		private function lock( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var isLocked:Boolean = parameters[1].toString().toLowerCase() == "true";
			var gameObject:GameObject = model.table.findObject(id) as GameObject;
			gameObject.isLocked = isLocked;
			
		}
		
		private function flip( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var isFaceDown:Boolean = parameters[1].toString().toLowerCase() == "true";
			var flippableObject:IFlippable = model.table.findObject(id) as IFlippable;
			flippableObject.flip(isFaceDown);
			
		}
		
		private function getLocationData( parameters:String ) : LocationData {
			
			var locationSplit:Array = parameters.split(",");
			return new LocationData( Number(locationSplit[0]), Number(locationSplit[1]), Number(locationSplit[2]) )
			
		}
		
		private function getContents( contents:String ) : ArrayCollection {
			
			if (contents) {
				
				var contentsSplit:Array = contents.split(",");
				var newContents:ArrayCollection = new ArrayCollection();
				for each (var content:String in contentsSplit) {
					
					newContents.addItem(Number(content));
				
				}
				
				return newContents;
			
			} else {
				
				return new ArrayCollection();
				
			}
		}
		
	}

}