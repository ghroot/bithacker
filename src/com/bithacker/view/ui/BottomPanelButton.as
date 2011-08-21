package com.bithacker.view.ui
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class BottomPanelButton extends Button
	{
		private var _screenClass : Class;
		private var _label : String;
		private var _textField : WrappedTextField;
		
		public function BottomPanelButton(displayObject : DisplayObject, screenClass : Class, label : String)
		{
			super(displayObject);
			
			_screenClass = screenClass;
			_label = label;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_textField = new WrappedTextField(findChildTextFieldWithName("textField"));
			_textField.text = _label;
			
			clicked.add(onClick);
		}
		
		private function onClick() : void
		{
			var newSubScreen : SubScreen = new _screenClass() as SubScreen;
			BitHacker.getMainScreen().setNewSubScreen(newSubScreen);
		}
	}
}