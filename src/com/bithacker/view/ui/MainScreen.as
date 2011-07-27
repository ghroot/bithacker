package com.bithacker.view.ui
{
	import com.bithacker.view.ui.core.Panel;
	import com.bithacker.view.ui.core.Screen;
	import com.bithacker.view.ui.core.ScreenSize;
	
	import flash.geom.Point;

	public class MainScreen extends Screen
	{
		protected var _bottomPanel : BottomPanel;
		protected var _subScreen : Screen;
		
		public function MainScreen()
		{
			super(new Point(ScreenSize.WIDTH, ScreenSize.HEIGHT), 0xeeeeee);
			
			initialise();
		}
		
		private function initialise() : void
		{
			initializeBottomPanel();
		}

		private function initializeBottomPanel() : void
		{
			_bottomPanel = new BottomPanel();
			_bottomPanel.y = height - _bottomPanel.height;
			addChild(_bottomPanel);
		}
		
		public function setSubScreen(newSubScreen : SubScreen) : void
		{
			if (_subScreen != null)
			{
				removeChild(_subScreen);
				_subScreen.destroy();
			}
			
			_subScreen = newSubScreen;
			
			if (_subScreen != null)
			{
				addChild(_subScreen);
			}
		}
	}
}