package com.bithacker.model.item.hardware
{
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.item.Item;

	public class CpuDescription extends HardwareDescription
	{
		private var _speed : uint;
		
		public function CpuDescription(id : uint, name : String, cost : Cost, speed : uint)
		{
			super(id, name, cost);
			
			_speed = speed;
		}
		
		public function getSpeed() : uint
		{
			return _speed;
		}
		
		override public function createItem() : Item
		{
			return new CpuItem(this);
		}
		
		override public function getDescriptionText() : String
		{
			return "Speed: " + getSpeed() + " MHZ";
		}
	}
}
