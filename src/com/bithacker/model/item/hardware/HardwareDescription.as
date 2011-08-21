package com.bithacker.model.item.hardware
{
	import com.bithacker.debug.Assert;
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.Item;

	public class HardwareDescription extends Description
	{
		public function HardwareDescription(id : uint, name : String, cost : Cost)
		{
			super(id, name, cost);
		}
		
		override public function createItem() : Item
		{
			if (CONFIG::DEBUG)
			{
				Assert.fail("Trying to create instance of abstract class HardwareItem");
			}
			
			return null;
		}
	}
}
