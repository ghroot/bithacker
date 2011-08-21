package com.bithacker.view.ui.shop
{
	import com.bithacker.model.database.Database;
	import com.bithacker.model.database.DatabaseNode;
	import com.bithacker.model.database.Group;
	import com.bithacker.model.item.Description;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.layout.Layout;
	import com.bithacker.view.ui.layout.VerticalLayout;
	
	public class ShopListSubScreen extends SubScreen
	{
		private var _group : Group;
		private var _layout : Layout;
		
		public function ShopListSubScreen(group : Group = null)
		{
			super();
			
			_group = group;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_layout = new VerticalLayout();
		
			if (_group == null)
			{
				_group = Database.instance.getRootGroup();
			}
			
			initialiseShopListEntries();
		}

		private function initialiseShopListEntries() : void
		{
			for (var i : uint = 0; i < _group.getDatabaseNodes().length; i++)
			{
				var shopListEntry : Button = null;
				var databaseNode : DatabaseNode = _group.getDatabaseNodes()[i];
				if (databaseNode is Description)
				{
					shopListEntry = new ShopListEntry(databaseNode as Description);
				}
				else if (databaseNode is Group)
				{
					shopListEntry = new ShopListCategoryEntry(databaseNode as Group);
				}
				getContentLayer().addElement(shopListEntry);
				_layout.addElement(shopListEntry);
			}
			
			_layout.arrange();
		}
		
		override public function getTitleText() : String
		{
			return _group.getName();
		}
	}
}