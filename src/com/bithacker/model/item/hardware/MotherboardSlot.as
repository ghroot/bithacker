package com.bithacker.model.item.hardware
{
	import com.bithacker.debug.Assert;

	public class MotherboardSlot
	{
		private var _hardwareDescriptionClass : Class;
		private var _fittedHardwareItem : HardwareItem;
		
		public function MotherboardSlot(hardwareDescriptionClass : Class)
		{
			_hardwareDescriptionClass = hardwareDescriptionClass;
		}
		
		public function getHardwareDescriptionClass() : Class
		{
			return _hardwareDescriptionClass;
		}
		
		public function fitHardwareItem(hardwareItem : HardwareItem) : void
		{
			if (CONFIG::DEBUG)
			{
				Assert.assertTrue(hardwareItem.getHardwareDescription() is getHardwareDescriptionClass(), "Trying to fit hardware item that doesn't fit");
				Assert.assertNull(_fittedHardwareItem, "Trying to fit hardware item when one is already fitted");
			}
			
			_fittedHardwareItem = hardwareItem;
			hardwareItem.setMotherboardSlot(this);
		}
		
		public function hasHardwareItemFitted() : Boolean
		{
			return _fittedHardwareItem != null;
		}
		
		public function isFree() : Boolean
		{
			return !hasHardwareItemFitted();
		}
		
		public function getFittedHardwareItem() : HardwareItem
		{
			return _fittedHardwareItem;
		}
		
		public function removeFittedHardwareItem() : void
		{
			if (CONFIG::DEBUG)
			{
				Assert.assertNotNull(_fittedHardwareItem, "Trying to unfit hardware item that is not fitted");
			}
			
			_fittedHardwareItem.setMotherboardSlot(null);
			_fittedHardwareItem = null;
		}
	}
}