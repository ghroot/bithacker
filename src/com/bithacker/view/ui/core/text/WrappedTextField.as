package com.bithacker.view.ui.core.text
{
	import com.bithacker.view.ui.core.Element;
	
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class WrappedTextField extends Element
	{
		private var _textField : TextField;

		public function WrappedTextField(textField : TextField)
		{
			super(textField);

			_textField = textField;

			initialise();
		}

		private function initialise() : void
		{
			_textField.embedFonts = true;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.mouseEnabled = false;
		}
		
		public function set text(text : String) : void
		{
			_textField.text = text;
		}

		public function setFont(fontName : String) : void
		{
			_textField.defaultTextFormat = new TextFormat(fontName, _textField.getTextFormat().size);
		}

		public function setSize(size : uint) : void
		{
			_textField.defaultTextFormat = new TextFormat(_textField.getTextFormat().font, size);
		}
	}
}
