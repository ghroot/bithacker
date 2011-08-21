package com.bithacker.view.ui.shop
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.database.Group;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.display.DisplayObject;
	
	public class ShopListCategoryEntry extends Button
	{
		private var _group : Group;
		private var _nameTextField : WrappedTextField;
		private var _infoTextField : WrappedTextField;
		
		public function ShopListCategoryEntry(group : Group)
		{
			super(DisplayUtil.createMovieClipFromName("ShopCategoryEntryScene"));
			
			_group = group;
			
			initialise();
		}
		
		private function initialise() : void
		{
			clicked.add(onClick);
			
			_nameTextField = new WrappedTextField(findChildTextFieldWithName("nameTextField"));
			_nameTextField.text = _group.getName();

			_infoTextField = new WrappedTextField(findChildTextFieldWithName("infoTextField"));
			_infoTextField.text = "";
		}
		
		private function onClick() : void
		{
			var shopListSubScreen : ShopListSubScreen = new ShopListSubScreen(_group);
			BitHacker.getMainScreen().setNextSubScreen(shopListSubScreen);
		}
	}
}