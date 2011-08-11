package com.bithacker.view.ui.shop
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.item.Description;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	
	public class ShopListEntry extends Button
	{
		private var _description : Description;
		private var _textField : WrappedTextField;
		
		public function ShopListEntry(description : Description)
		{
			super(new Point(ScreenSize.WIDTH, 60), 0xbbbbbb, 0x777777);
			
			_description = description;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_textField = new WrappedTextField();
			_textField.height = 60;
			_textField.defaultTextFormat = new TextFormat("FixedFont", 8, 0);
			_textField.embedFonts = true;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.text = _description.getDescriptionText();
			addChild(_textField);
			
			clicked.add(onClick);
			
			graphics.lineStyle(1, 0);
			graphics.drawRect(0, 0, width - 1, height - 1);
		}
		
		private function onClick() : void
		{
			var shopItemSubScreen : ShopItemSubScreen = new ShopItemSubScreen(_description);
			BitHacker.getMainScreen().setSubScreen(shopItemSubScreen, true);
		}
	}
}