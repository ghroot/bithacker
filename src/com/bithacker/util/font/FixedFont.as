package com.bithacker.util.font
{
	import flash.display.Sprite;
	
	public class FixedFont extends Sprite
	{
		[Embed(source = 'c:/development/bithacker/res/fonts/FIXED_V0.TTF', fontFamily = "FixedFont", fontStyle = "normal", fontWeight = "normal", mimeType = "application/x-font-truetype", embedAsCFF = "false")] 
		public static var FixedFont : Class;
	}
}