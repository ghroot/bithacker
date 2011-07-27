package com.bithacker.main
{
	import com.bithacker.view.ui.MainScreen;
	
	import flash.display.Sprite;
	
	[SWF(width="320", height="480", frameRate="60")]
	public class BitHacker extends Sprite
	{
		private static var _mainScreen : MainScreen;
		
		public function BitHacker()
		{
			_mainScreen = new MainScreen();
			addChild(_mainScreen);
		}
		
		public static function get mainScreen() : MainScreen
		{
			return _mainScreen;
		}
	}
}