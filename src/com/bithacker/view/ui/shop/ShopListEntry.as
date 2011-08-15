package com.bithacker.view.ui.shop
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.item.Description;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class ShopListEntry extends Button
	{
		private var _description : Description;
		private var _nameTextField : WrappedTextField;
		private var _costTextField : WrappedTextField;
		private var _infoTextField : WrappedTextField;
		
		public function ShopListEntry(description : Description)
		{
			super(DisplayUtil.createMovieClipFromName("ShopEntryScene"));
			
			_description = description;
			
			initialise();
		}
		
		private function initialise() : void
		{
			clicked.add(onClick);
			
			_nameTextField = new WrappedTextField(findChildTextFieldWithName("nameTextField"));
			_nameTextField.text = _description.getName();
			
			_costTextField = new WrappedTextField(findChildTextFieldWithName("costTextField"));
			_costTextField.text = _description.getCost().getFriendlyString();
			
			_infoTextField = new WrappedTextField(findChildTextFieldWithName("infoTextField"));
			_infoTextField.text = _description.getDescriptionText();
		}
		
		private function onClick() : void
		{
			var shopItemSubScreen : ShopItemSubScreen = new ShopItemSubScreen(_description);
			BitHacker.getMainScreen().setSubScreen(shopItemSubScreen, true);
		}
	}
}