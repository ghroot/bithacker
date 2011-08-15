package com.bithacker.model.item.hardware
{
	import com.bithacker.model.item.Description;

	public class MotherboardItem extends HardwareItem
	{
		private var _motherboardSlots : Vector.<MotherboardSlot>;

		public function MotherboardItem(description : Description)
		{
			super(description);

			initialise();
		}

		private function initialise() : void
		{
			initialiseMotherboardSlots();
		}

		private function initialiseMotherboardSlots() : void
		{
			_motherboardSlots = new Vector.<MotherboardSlot>();
			
			for (var cpuSlotIndex : uint = 0; cpuSlotIndex < getMotherboardDescription().getNCpuSlots(); cpuSlotIndex++)
			{
				var cpuSlot : MotherboardSlot = new MotherboardSlot(CpuDescription);
				_motherboardSlots.push(cpuSlot);
			}
			
			for (var memorySlotIndex : uint = 0; memorySlotIndex < getMotherboardDescription().getNMemorySlots(); memorySlotIndex++)
			{
				var memorySlot : MotherboardSlot = new MotherboardSlot(MemoryDescription);
				_motherboardSlots.push(memorySlot);
			}
			
			var networkcardSlot : MotherboardSlot = new MotherboardSlot(NetworkcardDescription);
			_motherboardSlots.push(networkcardSlot);
		}

		public function getMotherboardDescription() : MotherboardDescription
		{
			return getDescription() as MotherboardDescription;
		}

		public function getMotherboardSlots() : Vector.<MotherboardSlot>
		{
			return _motherboardSlots;
		}
		
		public function getFreeMotherboardSlotForHardwareDescriptionClass(hardwareDescriptionClass : Class) : MotherboardSlot
		{
			for each (var motherboardSlot : MotherboardSlot in getMotherboardSlots())
			{
				if (motherboardSlot.getHardwareDescriptionClass() == hardwareDescriptionClass &&
					motherboardSlot.isFree())
				{
					return motherboardSlot;
				}
			}
			return null;
		}
		
		public function hasFreeMotherboardSlotForHardwareDescriptionClass(hardwareDescriptionClass : Class) : Boolean
		{
			return getFreeMotherboardSlotForHardwareDescriptionClass(hardwareDescriptionClass) != null;
		}
		
		// TODO: Make this object oriented
		public function getTotalCpuSpeed() : uint
		{
			var totalCpuSpeed : uint = 0;
			for each (var motherboardSlot : MotherboardSlot in getMotherboardSlots())
			{
				if (motherboardSlot.getFittedHardwareItem() is CpuItem)
				{
					var cpuItem : CpuItem = motherboardSlot.getFittedHardwareItem() as CpuItem;
					totalCpuSpeed += cpuItem.getCpuDescription().getSpeed();
				}
			}
			return totalCpuSpeed;
		}
		
		// TODO: Make this object oriented
		public function getTotalMemoryCapacity() : uint
		{
			var totalMemoryCapacity : uint = 0;
			for each (var motherboardSlot : MotherboardSlot in getMotherboardSlots())
			{
				if (motherboardSlot.getFittedHardwareItem() is MemoryItem)
				{
					var memoryItem : MemoryItem = motherboardSlot.getFittedHardwareItem() as MemoryItem;
					totalMemoryCapacity += memoryItem.getMemoryDescription().getCapacity();
				}
			}
			return totalMemoryCapacity;
		}
	}
}
