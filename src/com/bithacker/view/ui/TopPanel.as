package com.bithacker.view.ui
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.Panel;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.geom.Point;

	public class TopPanel extends Panel
	{
		public static const HEIGHT : uint = 50;

		private var _backButton : Button;
		private var _titleTextField : WrappedTextField;

		public function TopPanel()
		{
			super(DisplayUtil.createSpriteFromName("TopPanelScene"));

			initialise();
		}

		private function initialise() : void
		{
			initialiseBackButton();
			
			_titleTextField = new WrappedTextField(findChildTextFieldWithName("titleTextField"));
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
			BitHacker.getMainScreen().setPreviousSubScreen();
		}
		
		public function setTitleText(text : String) : void
		{
			_titleTextField.text = text;
		}
	}
}
