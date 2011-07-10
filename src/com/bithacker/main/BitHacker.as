package com.bithacker.main
{
	import com.bithacker.ui.main.MainScreen;
	
	import flash.display.Sprite;
	
	[SWF(width="320", height="480")]
	public class BitHacker extends Sprite
	{
		public function BitHacker()
		{
			addChild(new MainScreen());
		}
	}
}