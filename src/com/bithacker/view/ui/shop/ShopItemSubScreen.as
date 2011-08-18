package com.bithacker.view.ui.shop
{
	import com.bithacker.model.item.Description;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.text.TextField;

	public class ShopItemSubScreen extends SubScreen
	{
		private var _description : Description;
		private var _textField : WrappedTextField;
		private var _buyButton : Button;

		public function ShopItemSubScreen(description : Description)
		{
			super();

			_description = description;

			initialise();
		}

		private function initialise() : void
		{
			_textField = new WrappedTextField(new TextField());
			_textField.width = ScreenSize.WIDTH;
			_textField.height = 60;
			_textField.setFont("wendy");
			_textField.setSize(20);
			_textField.text = _description.getName();
			addElement(_textField);

			_buyButton = new BuyButton(DisplayUtil.createMovieClipFromName("BuyButtonScene"), _description);
			_buyButton.x = 10;
			_buyButton.y = 50;
			addElement(_buyButton);
		}
	}
}
