package com.bithacker.main
{
	import com.bithacker.model.user.User;
	import com.bithacker.util.font.FontLoader;
	import com.bithacker.view.ui.MainScreen;
	
	import flash.display.Sprite;
	import flash.events.Event;

	[SWF(width = "320", height = "480", frameRate = "60")]
	public class BitHacker extends Sprite
	{
		private static var _user : User;
		
		private static var _fontLoader : FontLoader;
		private static var _mainScreen : MainScreen;

		public function BitHacker()
		{
			_fontLoader = new FontLoader();
			_fontLoader.addEventListener(Event.COMPLETE, onFontLoaded);
		}

		private function onFontLoaded(event : Event) : void
		{
			_fontLoader.removeEventListener(Event.COMPLETE, onFontLoaded);
		
			_user = new User();
			
			_mainScreen = new MainScreen();
			addChild(_mainScreen);
		}

		public static function getMainScreen() : MainScreen
		{
			return _mainScreen;
		}
		
		public static function getUser() : User
		{
			return _user;
		}
	}
}
