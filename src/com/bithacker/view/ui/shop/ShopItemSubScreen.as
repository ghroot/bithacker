package com.bithacker.view.ui.shop
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.Item;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;

	public class ShopItemSubScreen extends SubScreen
	{
		private var _description : Description;
		private var _textField : WrappedTextField;
		private var _buyButton : Button;

		public function ShopItemSubScreen(description : Description)
		{
			super(0xffffff);

			_description = description;

			initialise();
		}

		private function initialise() : void
		{
			_textField = new WrappedTextField();
			_textField.height = 60;
			_textField.defaultTextFormat = new TextFormat("FixedFont", 8, 0xffffff);
			_textField.embedFonts = true;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.text = _description.getDescriptionText();
			addChild(_textField);

			_buyButton = new Button(new Point(60, 25), 0x888888, 0x555555);
			_buyButton.x = 10;
			_buyButton.y = 50;
			_buyButton.clicked.add(onBuyButtonClicked);
			addChild(_buyButton);
		}

		private function onBuyButtonClicked() : void
		{
			var itemToBuy : Item = _description.createItem();
			BitHacker.getUser().buy(itemToBuy);
		}
	}
}
