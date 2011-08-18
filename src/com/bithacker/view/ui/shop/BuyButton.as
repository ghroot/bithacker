package com.bithacker.view.ui.shop
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.activity.software.SoftwareActivity;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.Item;
	import com.bithacker.model.item.software.SoftwareItem;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.display.DisplayObject;
	
	public class BuyButton extends Button
	{
		private var _description : Description;
		private var _textField : WrappedTextField;
		
		public function BuyButton(displayObject : DisplayObject, description : Description)
		{
			super(displayObject);
			
			_description = description;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_textField = new WrappedTextField(findChildTextFieldWithName("textField"));
			
			clicked.add(onBuyButtonClicked);
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