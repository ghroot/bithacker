package com.bithacker.model.item.hardware
{
	import com.bithacker.model.item.Description;

	public class HarddriveItem extends HardwareItem
	{
		public function HarddriveItem(description : Description)
		{
			super(description);
		}
		
		override public function getHarddriveDescription() : HarddriveDescription
		{
			return getDescription() as HarddriveDescription;
		}
	}
}
