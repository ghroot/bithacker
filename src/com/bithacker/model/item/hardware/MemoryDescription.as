package com.bithacker.model.item.hardware
{
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.item.Item;

	public class MemoryDescription extends HardwareDescription
	{
		private var _capacity : uint;

		public function MemoryDescription(id : uint, name : String, cost : Cost, capacity : uint)
		{
			super(id, name, cost);

			_capacity = capacity;
		}

		public function getCapacity() : uint
		{
			return _capacity;
		}

		override public function createItem() : Item
		{
			return new MemoryItem(this);
		}

		override public function getDescriptionText() : String
		{
			return "Capacity: " + getCapacity() + " MB";
		}
	}
}
