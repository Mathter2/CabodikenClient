package com.mfierro.cabodiken.model 
{
	/**
	 * ...
	 * @author Matías Fierro
	 */
	[Bindable]
	public class Card extends GameObject {
		
		public function Card( id:int, resourceId:int, name:String )	{
		
			super(id, resourceId, name);
			
		}
		
	}

}