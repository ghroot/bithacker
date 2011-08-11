package com.bithacker.view.ui.shop
{
	import com.bithacker.model.database.Database;
	import com.bithacker.model.item.Description;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.core.Screen;
	
	public class ShopListSubScreen extends SubScreen
	{
		private var _descriptions : Vector.<Description>;
		
		public function ShopListSubScreen()
		{
			super(0x000000);
			
			initialise();
		}
		
		private function initialise() : void
		{
			_descriptions = Database.instance.getShopDescriptions();
			
			initialiseShopListEntries();
		}

		private function initialiseShopListEntries() : void
		{
			for (var i : uint = 0; i < _descriptions.length; i++)
			{
				var shopListEntry : ShopListEntry = new ShopListEntry(_descriptions[i]);
				shopListEntry.y = i * shopListEntry.height;
				getContentLayer().addChild(shopListEntry);
			}
		}
	}
}