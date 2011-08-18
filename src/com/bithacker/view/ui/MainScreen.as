package com.bithacker.view.ui
{
	import com.bithacker.view.ui.core.Screen;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.shop.ShopListSubScreen;
	
	import flash.geom.Point;

	public class MainScreen extends Screen
	{
		private var _topPanel : TopPanel;
		private var _bottomPanel : BottomPanel;
		private var _subScreen : Screen;
		private var _previousScreens : Vector.<SubScreen>;

		public function MainScreen()
		{
			super(new Point(ScreenSize.WIDTH, ScreenSize.HEIGHT));
			
			initialise();
		}

		private function initialise() : void
		{
			_previousScreens = new Vector.<SubScreen>();
			
			initialiseTopPanel();
			initialiseBottomPanel();
			
			// TEMP: Start on ShopListSubScreen
			setSubScreen(new ShopListSubScreen());
		}

		private function initialiseTopPanel() : void
		{
			_topPanel = new TopPanel();
			addElement(_topPanel);
		}

		private function initialiseBottomPanel() : void
		{
			_bottomPanel = new BottomPanel();
			_bottomPanel.y = height - _bottomPanel.height;
			addElement(_bottomPanel);
		}
		
		private function destroyPreviousSubScreens() : void
		{
			for (var i : int = _previousScreens.length - 1; i >= 0; i--)
			{
				_previousScreens[i].destroy();
			}
			_previousScreens.splice(0, _previousScreens.length);
		}
		
		public function setSubScreen(newSubScreen : SubScreen, canGoBackToPreviousScreen : Boolean = false) : void
		{
			if (_subScreen != null)
			{
				removeElement(_subScreen);
				
				if (canGoBackToPreviousScreen)
				{
					_previousScreens.push(_subScreen);
				}
				else
				{
					destroyPreviousSubScreens();
					_subScreen.destroy();
				}
			}

			_subScreen = newSubScreen;
			_subScreen.y = _topPanel.height;
			_subScreen.refresh();
			
			if (_subScreen != null)
			{
				addElement(_subScreen);
			}
			
			_topPanel.getBackButton().visible = _previousScreens.length > 0;
		}
		
		public function goToPreviousScreen() : void
		{
			setSubScreen(_previousScreens.pop());
		}
	}
}
