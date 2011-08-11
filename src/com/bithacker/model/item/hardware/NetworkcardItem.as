package com.bithacker.model.item.hardware
{
	import com.bithacker.model.item.Description;

	public class NetworkcardItem extends HardwareItem
	{
		public function NetworkcardItem(description : Description)
		{
			super(description);
		}
		
		public function getNetworkcardDescription() : NetworkcardDescription
		{
			return getDescription() as NetworkcardDescription;
		}
	}
}
