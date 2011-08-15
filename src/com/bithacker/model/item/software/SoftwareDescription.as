package com.bithacker.model.item.software
{
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.Item;

	public class SoftwareDescription extends Description
	{
		private var _version : String;
		private var _runDuration : uint;
		
		public function SoftwareDescription(name : String, cost : Cost, version : String, runDuration : uint)
		{
			super(name, cost);
			
			_version = version;
			_runDuration = runDuration;
		}
		
		public function getVersion() : String
		{
			return _version;
		}
		
		public function getRunDuration() : uint
		{
			return _runDuration;
		}
		
		override public function createItem() : Item
		{
			return new SoftwareItem(this);
		}
	}
}
