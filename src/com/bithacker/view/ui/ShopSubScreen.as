package com.bithacker.view.ui
{
	import com.bithacker.view.ui.core.Screen;
	
	public class ShopSubScreen extends SubScreen
	{
		public function ShopSubScreen()
		{
			super(0x000000);
			
			initialiseShopEntries();
		}

		private function initialiseShopEntries() : void
		{
			for (var i : uint = 0; i < 15; i++)
			{
				var shopEntry : ShopEntry = new ShopEntry("ShopEntry" + i);
				shopEntry.y = i * shopEntry.height;
				getContent().addChild(shopEntry);
			}
		}
	}
}