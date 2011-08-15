package com.bithacker.model.item.hardware
{
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.Item;

	public class HardwareItem extends Item
	{
		private var _motherboardSlot : MotherboardSlot;
		
		public function HardwareItem(description : Description)
		{
			super(description);
		}
		
		public function getHardwareDescription() : HardwareDescription
		{
			return getDescription() as HardwareDescription;
		}
		
		public function setMotherboardSlot(motherboardSlot : MotherboardSlot) : void
		{
			_motherboardSlot = motherboardSlot;
		}
		
		public function isFitted() : Boolean
		{
			return _motherboardSlot != null;
		}
	}
}
