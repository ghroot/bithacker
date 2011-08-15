package com.bithacker.view.ui
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	
	public class BottomPanelButton extends Button
	{
		private var _screenClass : Class;
		
		public function BottomPanelButton(screenClass : Class)
		{
			super(DisplayUtil.createSprite(50, 50, 0xcccccc));
			
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