package com.bithacker.model.requirement.hardware
{
	public class HarddriveRequirement extends HardwareRequirement
	{
		private var _requiredStorage : uint;
		
		public function HarddriveRequirement(requiredStorage : uint)
		{
			super();
			
			_requiredStorage = requiredStorage;
		}
	}
}