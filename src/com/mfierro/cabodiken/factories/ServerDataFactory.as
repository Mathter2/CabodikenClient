package com.mfierro.cabodiken.factories {
	import com.adobe.serialization.json.JSONDecoder;
	import mx.collections.ArrayCollection;
	
	import com.mfierro.cabodiken.vo.*;
	
	
	public class ServerDataFactory {
		
		public static function buildUserData ( user:Object ):UserData {
			
			return new UserData(user.Id, user.Name, user.Host, user.Message, user.IsOnline);
			
		}
		
		public static function buildFriendsList( list:Object ) : ArrayCollection {
			
			var friendsList : ArrayCollection = new ArrayCollection();
			
			if (list != null && list.length > 1) 
			{
				for (var index:int = 1; index < list.length ; index++) 
				{
					friendsList.addItem( buildUserData( list[index] ) );
				}
			}
			
			return friendsList;
			
		}
		
		public static function buildInvitationData ( invitation:Object ):InvitationData {
			
			return new InvitationData( buildUserData( invitation.Sender ), invitation.GameSessionId, invitation.GameName );
			
		}
		
		public static function buildInvitationsList( list:Object ) : ArrayCollection {
			
			var invitationsList : ArrayCollection = new ArrayCollection();
			
			if (list != null) 
			{
				for (var index:int = 0; index < list.length ; index++) 
				{
					invitationsList.addItem( buildInvitationData( list[index] ) );
				}
			}
			
			return invitationsList;
			
		}
		
		public static function buildObjectDataList ( list:Object ) : ArrayCollection {
			
			var objectDataList : ArrayCollection = new ArrayCollection();
			
			if (list != null) 
			{
				for (var index:int = 0; index < list.length; index++) 
				{
					objectDataList.addItem( buildObjectData( list[index] ) );
				}
			}
			
			return objectDataList;
		}
		
		public static function buildObjectData ( objectData:Object ) : ObjectData {
			
			return new ObjectData( objectData.Id, objectData.Name, objectData.Type );
			
		}
		
		public static function buildPlayerData ( playerData:Object ) : PlayerData {
			
			return new PlayerData( buildUserData(playerData), playerData.CustomDices, playerData.CustomDecks, playerData.CustomTokens, playerData.Place, playerData.Number)
			
		}
		
		public static function buildGameSession ( gameSession:Object ) : GameSessionData {
			
			var players:ArrayCollection = new ArrayCollection();
			
			if (gameSession.Players != null) 
			{
				for (var index:int = 0; index < gameSession.Players.length; index++) 
				{
					players.addItem( buildPlayerData(gameSession.Players[index]) );
				}
			}
			return new GameSessionData( buildObjectData(gameSession.Game), gameSession.GameSessionId, gameSession.IsGameStarted, players );
			
		}
		
	}
}