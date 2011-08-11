package com.bithacker.model.item.hardware
{
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.item.Description;

	public class HardwareDescription extends Description
	{
		public function HardwareDescription(name : String, cost : Cost)
		{
			super(name, cost);
		}
	}
}
