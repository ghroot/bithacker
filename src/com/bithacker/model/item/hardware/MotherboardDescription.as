package com.bithacker.model.item.hardware
{
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.item.Item;

	public class MotherboardDescription extends HardwareDescription
	{
		private var _nCpuSlots : uint;
		private var _nMemorySlots : uint;
		
		public function MotherboardDescription(name : String, cost : Cost, nCpuSlots : uint, nMemorySlots : uint)
		{
			super(name, cost);
			
			_nCpuSlots = nCpuSlots;
			_nMemorySlots = nMemorySlots;
		}
		
		public function getNCpuSlots() : uint
		{
			return _nCpuSlots;
		}

		public function getNMemorySlots() : uint
		{
			return _nMemorySlots;
		}
		
		override public function createItem() : Item
		{
			return new MotherboardItem(this);
		}
	}
}
