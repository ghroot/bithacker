package com.bithacker.model.item.hardware
{
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.item.Item;

	public class NetworkcardDescription extends HardwareDescription
	{
		private var _bandwidth : uint;
		
		public function NetworkcardDescription(name : String, cost : Cost, bandwidth : uint)
		{
			super(name, cost);
			
			_bandwidth = bandwidth;
		}
		
		public function getBandwidth() : uint
		{
			return _bandwidth;
		}
		
		override public function createItem() : Item
		{
			return new NetworkcardItem(this);
		}
		
		override public function getDescriptionText() : String
		{
			return super.getDescriptionText() + "\nBandwidth: " + getBandwidth();
		}
	}
}
