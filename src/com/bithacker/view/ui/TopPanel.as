package com.bithacker.view.ui
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.Panel;
	import com.bithacker.view.ui.core.ScreenSize;
	
	import flash.geom.Point;

	public class TopPanel extends Panel
	{
		public static const HEIGHT : uint = 30;

		private var _backButton : Button;

		public function TopPanel()
		{
			super(new Point(ScreenSize.WIDTH, HEIGHT), 0xdddddd);

			initialise();
		}

		private function initialise() : void
		{
			initialiseBackButton();
		}

		private function initialiseBackButton() : void
		{
			_backButton = new Button(new Point(30, 20), 0xcccccc, 0x555555);
			_backButton.x = 5;
			_backButton.y = 5;
			_backButton.clicked.add(onBackButtonClicked);
			addChild(_backButton);
		}
		
		public function getBackButton() : Button
		{
			return _backButton;
		}
		
		private function onBackButtonClicked() : void
		{
			BitHacker.getMainScreen().goToPreviousScreen();
		}
	}
}
