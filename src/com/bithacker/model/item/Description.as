package com.bithacker.model.item
{
	import com.bithacker.debug.Assert;
	import com.bithacker.model.database.currency.Cost;

	public class Description
	{
		private var _name : String;
		private var _cost : Cost;
		
		public function Description(name : String, cost : Cost)
		{
			super();
			
			_name = name;
			_cost = cost;
		}
		
		public function getName() : String
		{
			return _name;
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
			return getName() + "\n" + getCost().getFriendlyString();
		}
	}
}