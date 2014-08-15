package com.mfierro.cabodiken.model 
{
	import mx.collections.ArrayCollection;
	import mx.core.UIComponent;
	
	/**
	 * ...
	 * @author Matías Fierro
	 */
	public interface IContainer
	{
		
		function reorder( contents:ArrayCollection ) : void;
		
		function draw() : UIComponent;
		
	}
	
}