package com.bithacker.view.ui.shop
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.activity.software.SoftwareActivity;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.Item;
	import com.bithacker.model.item.software.SoftwareItem;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.text.WrappedTextField;

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
			_textField = new WrappedTextField();
			_textField.height = 60;
			_textField.setFont("wendy");
			_textField.setSize(20);
			_textField.text = _description.getName();
			addChild(_textField);

			_buyButton = new Button(DisplayUtil.createSprite(60, 25, 0x888888));
			_buyButton.x = 10;
			_buyButton.y = 50;
			_buyButton.clicked.add(onBuyButtonClicked);
			addChild(_buyButton);
		}

		private function onBuyButtonClicked() : void
		{
			var itemToBuy : Item = _description.createItem();
			BitHacker.getUser().buy(itemToBuy);
			
			// TEMP: Start software activity
			if (itemToBuy is SoftwareItem)
			{
				BitHacker.getUser().addAndStartActivity(new SoftwareActivity(itemToBuy as SoftwareItem));
			}
		}
	}
}
