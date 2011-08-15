package com.bithacker.model.item.hardware
{
	import com.bithacker.model.database.currency.Cost;

	public class HarddriveDescription extends HardwareDescription
	{
		private var _storage : uint;
		
		public function HarddriveDescription(name : String, cost : Cost, storage : uint)
		{
			super(name, cost);
			
			_storage = storage;
		}
		
		public function getStorage() : uint
		{
			return _storage;
		}
		
		override public function getDescriptionText() : String
		{
			return "Storage: " + getStorage() + " GB";
		}
	}
}
