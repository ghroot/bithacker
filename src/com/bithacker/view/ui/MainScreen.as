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
		private var _subScreen : SubScreen;
		private var _previousSubScreens : Vector.<SubScreen>;

		public function MainScreen()
		{
			super(new Point(ScreenSize.WIDTH, ScreenSize.HEIGHT));
			
			initialise();
		}

		private function initialise() : void
		{
			_previousSubScreens = new Vector.<SubScreen>();
			
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
			for (var i : int = _previousSubScreens.length - 1; i >= 0; i--)
			{
				_previousSubScreens[i].destroy();
			}
			_previousSubScreens.splice(0, _previousSubScreens.length);
		}

		public function setNewSubScreen(newSubScreen : SubScreen) : void
		{
			destroyCurrentSubScreen();
			destroyPreviousSubScreens();
			setSubScreen(newSubScreen);
		}
		
		public function setNextSubScreen(nextSubScreen : SubScreen) : void
		{
			addCurrentSubScreenToPreviousSubScreens();
			setSubScreen(nextSubScreen);
		}
		
		public function setPreviousSubScreen() : void
		{
			destroyCurrentSubScreen();
			setSubScreen(_previousSubScreens.pop());
		}
		
		private function destroyCurrentSubScreen() : void
		{
			if (_subScreen != null)
			{
				_subScreen.destroy();
			}
		}
		
		private function addCurrentSubScreenToPreviousSubScreens() : void
		{
			_previousSubScreens.push(_subScreen);
		}
		
		private function setSubScreen(newSubScreen : SubScreen) : void
		{
			if (_subScreen != null)
			{
				removeElement(_subScreen);
			}

			_subScreen = newSubScreen;
			_subScreen.y = _topPanel.height;
			_subScreen.refresh();
			
			if (_subScreen != null)
			{
				addElement(_subScreen);
			}
			
			updateBackButtonVisibility();
			
			_topPanel.setTitleText(_subScreen.getTitleText());
		}
		
		private function updateBackButtonVisibility() : void
		{
			_topPanel.getBackButton().visible = _previousSubScreens.length > 0;
		}
	}
}
