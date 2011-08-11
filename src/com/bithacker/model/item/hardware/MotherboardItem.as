package com.bithacker.model.item.hardware
{
	import com.bithacker.model.item.Description;

	public class MotherboardItem extends HardwareItem
	{
		private var _fittedCpuItems : Vector.<CpuItem>;
		private var _fittedMemoryItems : Vector.<MemoryItem>;
		private var _fittedNetworkcard : NetworkcardItem;

		public function MotherboardItem(description : Description)
		{
			super(description);

			initialise();
		}

		private function initialise() : void
		{
			_fittedCpuItems = new Vector.<CpuItem>(getMotherboardDescription().getNCpuSlots(), true);
			_fittedMemoryItems = new Vector.<MemoryItem>(getMotherboardDescription().getNMemorySlots(), true);
		}

		public function getMotherboardDescription() : MotherboardDescription
		{
			return getDescription() as MotherboardDescription;
		}
	}
}
