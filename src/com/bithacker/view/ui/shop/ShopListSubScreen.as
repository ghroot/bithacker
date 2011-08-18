package com.bithacker.view.ui.shop
{
	import com.bithacker.model.database.Database;
	import com.bithacker.model.item.Description;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.layout.Layout;
	import com.bithacker.view.ui.layout.VerticalLayout;
	
	public class ShopListSubScreen extends SubScreen
	{
		private var _layout : Layout;
		
		public function ShopListSubScreen()
		{
			super();
			
			initialise();
		}
		
		private function initialise() : void
		{
			_layout = new VerticalLayout();
			
			initialiseShopListEntries();
		}

		private function initialiseShopListEntries() : void
		{
			var descriptions : Vector.<Description> = Database.instance.getShopDescriptions();
			for (var i : uint = 0; i < descriptions.length; i++)
			{
				var shopListEntry : ShopListEntry = new ShopListEntry(descriptions[i]);
				getContentLayer().addElement(shopListEntry);
				_layout.addElement(shopListEntry);
			}
			
			_layout.arrange();
		}
	}
}