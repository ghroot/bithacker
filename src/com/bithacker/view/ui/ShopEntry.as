package com.bithacker.view.ui
{
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class ShopEntry extends Button
	{
		private var _label : String;
		private var _textField : WrappedTextField;
		
		public function ShopEntry(label : String)
		{
			super(new Point(ScreenSize.WIDTH, 60), 0xbbbbbb, 0x777777);
			
			_label = label;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_textField = new WrappedTextField();
			_textField.height = 60;
			_textField.text = _label;
			addChild(_textField);
			
			clicked.add(onClick);
			
			graphics.lineStyle(1, 0);
			graphics.drawRect(0, 0, width - 1, height - 1);
		}
		
		private function onClick() : void
		{
			trace("shop entry clicked: " + _textField.text);
		}
	}
}