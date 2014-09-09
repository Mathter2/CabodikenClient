package com.mfierro.cabodiken.responders 
{
	import com.mfierro.cabodiken.model.Area;
	import com.mfierro.cabodiken.model.Card;
	import com.mfierro.cabodiken.model.Deck;
	import com.mfierro.cabodiken.model.GameObject;
	import com.mfierro.cabodiken.model.IContainer;
	import com.mfierro.cabodiken.model.IFlippable;
	import com.mfierro.cabodiken.model.CabodikenModel;
	import com.mfierro.cabodiken.vo.LocationData;
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.IResponder;
	import mx.controls.Alert;
	
	public class GetActionsResponder implements IResponder {
		
		private var model:CabodikenModel = CabodikenModel.getInstance();
		
		public function result( e:Object ):void {
			
			var event:ResultEvent = e as ResultEvent;
			if ( event.result.length > 0 ) 
			{
				if (!model.isExecutingAction) {
					
					model.isExecutingAction = true;
					for each (var action:Object in event.result) 
					{
						if(action.Index >= model.lastActionId) {
							
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
								case "REMOVE":
									remove(action.Parameters);
									break;
								default:
								Alert.show("Cannot find action: " + action.Name, "Internal Error");
							}
							
							model.lastActionId = action.Index + 1;
							
						}
						
					}
					
					model.isExecutingAction = false;
					
				}
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
			var areaId:int = parameters.getItemAt(4) as Number;
			var isLocked:Boolean = (parameters.getItemAt(5) as String).toLowerCase() == "true";
			var isFaceDown:Boolean = (parameters.getItemAt(6) as String).toLowerCase() == "true";
			var cardsString:String = parameters.getItemAt(7) as String;
			var cards:ArrayCollection = new ArrayCollection();
			
			for each (var cardId:String in cardsString.split(";")) {
				
				cards.addItem(Number(cardId));
				
			}
			
			deck = new Deck(id, resourceId, "", location, rotation, isLocked);
			deck.isFaceDown = isFaceDown;
			deck.cards = cards;
			model.gameObjectCollection.addObject(deck);
			
		}
		
		private function createCard( parameters:ArrayCollection ) : void {

			var card:Card;
			var id:int = Number(parameters.getItemAt(0));
			var resourceId:int = Number(parameters.getItemAt(1));
			var rotation:int = Number(parameters.getItemAt(2));
			var location:LocationData = getLocationData(parameters.getItemAt(3) as String);
			var isLocked:Boolean = (parameters.getItemAt(4) as String).toLowerCase() == "true";
			var isFaceDown:Boolean = (parameters.getItemAt(5) as String).toLowerCase() == "true";
			
			card = new Card(id, resourceId, "", location, rotation, isLocked );
			card.isFaceDown = isFaceDown;
			model.gameObjectCollection.addObject(card);
			
		}
		
		private function move( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var location:LocationData = getLocationData(parameters[1] as String);
			var gameObject:GameObject = model.gameObjectCollection.findObject(id);
			gameObject.location = location;
			
		}
		
		private function reorder( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var contents:ArrayCollection = getContents(parameters[1]);
			var container:IContainer = model.gameObjectCollection.findObject(id) as IContainer;
			container.reorder(contents);
			
		}
		
		private function lock( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var isLocked:Boolean = parameters[1].toString().toLowerCase() == "true";
			var gameObject:GameObject = model.gameObjectCollection.findObject(id) as GameObject;
			gameObject.isLocked = isLocked;
			
		}
		
		private function flip( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			var isFaceDown:Boolean = parameters[1].toString().toLowerCase() == "true";
			var flippableObject:IFlippable = model.gameObjectCollection.findObject(id) as IFlippable;
			flippableObject.flip(isFaceDown);
			
		}
		
		private function remove( parameters:ArrayCollection ) : void {
			
			var id:int = Number(parameters[0]);
			model.gameObjectCollection.removeObject(id);
			
		}
		
		private function getLocationData( parameters:String ) : LocationData {
			
			var locationSplit:Array = parameters.split(",");
			return new LocationData( Number(locationSplit[0]), Number(locationSplit[1]), 
				Number(locationSplit[2]), Number(locationSplit[3]) );
			
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