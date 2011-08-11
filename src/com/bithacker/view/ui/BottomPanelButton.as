package com.bithacker.view.ui
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.view.ui.core.Button;
	
	import flash.geom.Point;
	
	public class BottomPanelButton extends Button
	{
		private var _screenClass : Class;
		
		public function BottomPanelButton(screenClass : Class)
		{
			super(new Point(50, 50), 0xcccccc, 0x555555);
			
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