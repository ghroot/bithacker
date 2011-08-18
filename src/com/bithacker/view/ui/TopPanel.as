package com.bithacker.view.ui
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.Panel;
	import com.bithacker.view.ui.core.ScreenSize;
	
	import flash.geom.Point;

	public class TopPanel extends Panel
	{
		public static const HEIGHT : uint = 50;

		private var _backButton : Button;

		public function TopPanel()
		{
			super(DisplayUtil.createSpriteFromName("TopPanelScene"));

			initialise();
		}

		private function initialise() : void
		{
			initialiseBackButton();
		}

		private function initialiseBackButton() : void
		{
			_backButton = new Button(findChildMovieClipWithName("backButton"));
			_backButton.clicked.add(onBackButtonClicked);
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
