package com.bithacker.view.ui
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.view.ui.core.Button;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class BottomPanelButton extends Button
	{
		private var _screenClass : Class;
		
		public function BottomPanelButton(displayObject : DisplayObject, screenClass : Class)
		{
			super(displayObject);
			
			_screenClass = screenClass;
			
			initialise();
		}
		
		private function initialise() : void
		{
			clicked.add(onClick);
		}
		
		private function onClick() : void
		{
			var newSubScreen : SubScreen = new _screenClass() as SubScreen;
			BitHacker.getMainScreen().setSubScreen(newSubScreen);
		}
	}
}