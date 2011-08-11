package com.bithacker.model.item.hardware
{
	import com.bithacker.model.item.Description;

	public class MemoryItem extends HardwareItem
	{
		public function MemoryItem(description : Description)
		{
			super(description);
		}
		
		public function getMemoryDescription() : MemoryDescription
		{
			return getDescription() as MemoryDescription;
		}
	}
}
