package com.bithacker.model.item.hardware
{
	import com.bithacker.model.item.Description;

	public class CpuItem extends HardwareItem
	{
		public function CpuItem(description : Description)
		{
			super(description);
		}
		
		public function getCpuDescription() : CpuDescription
		{
			return getDescription() as CpuDescription;
		}
	}
}
