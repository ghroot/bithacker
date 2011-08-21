package com.bithacker.model.item
{
	import com.bithacker.debug.Assert;
	import com.bithacker.model.database.DatabaseNode;
	import com.bithacker.model.database.currency.Cost;

	public class Description extends DatabaseNode
	{
		private var _cost : Cost;
		
		public function Description(id : uint, name : String, cost : Cost)
		{
			super(id, name);
			
			_cost = cost;
		}
		
		public function getCost() : Cost
		{
			return _cost;
		}
		
		public function createItem() : Item
		{
			if (CONFIG::DEBUG)
			{
				Assert.fail("Trying to create instance of abstract class Item");
			}
			
			return null;
		}
		
		public function getDescriptionText() : String
		{
			return "";
		}
	}
}