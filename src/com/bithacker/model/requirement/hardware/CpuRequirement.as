package com.bithacker.model.requirement.hardware
{
	import com.bithacker.model.item.hardware.MotherboardItem;
	import com.bithacker.model.requirement.RequirementContext;

	public class CpuRequirement extends HardwareRequirement
	{
		private var _requiredSpeed : uint;
		
		public function CpuRequirement(requiredSpeed : uint)
		{
			super();
			
			_requiredSpeed = requiredSpeed;
		}
		
		override public function isSatisfied(context : RequirementContext) : Boolean
		{
			var motherboardItem : MotherboardItem = context.getUser().getItemCollection().getFirstItemWithClass(MotherboardItem) as MotherboardItem;
			return motherboardItem.getTotalCpuSpeed() >= _requiredSpeed;
		}
	}
}