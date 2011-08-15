package com.bithacker.model.requirement.hardware
{
	public class MemoryRequirement extends HardwareRequirement
	{
		private var _requiredCapacity : uint;
		
		public function MemoryRequirement(requiredCapacity : uint)
		{
			super();
			
			_requiredCapacity = requiredCapacity;
		}
	}
}