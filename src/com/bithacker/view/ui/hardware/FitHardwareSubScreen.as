package com.bithacker.view.ui.hardware
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.item.Item;
	import com.bithacker.model.item.hardware.HarddriveItem;
	import com.bithacker.model.item.hardware.HardwareItem;
	import com.bithacker.model.item.hardware.MotherboardSlot;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.layout.Layout;
	import com.bithacker.view.ui.layout.VerticalLayout;

	public class FitHardwareSubScreen extends SubScreen
	{
		private var _layout : Layout;
		private var _motherboardSlot : MotherboardSlot;
		
		public function FitHardwareSubScreen(motherboardSlot : MotherboardSlot)
		{
			super();
			
			_motherboardSlot = motherboardSlot;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_layout = new VerticalLayout();
			
			initialiseFitHardwareSlotEntries();
		}
		
		public function getMotherboardSlot() : MotherboardSlot
		{
			return _motherboardSlot;
		}
		
		private function initialiseFitHardwareSlotEntries() : void
		{
			var unFittedHardwareItems : Vector.<HardwareItem> = getUnFittedHardwareItemsWithHardwareDescriptionClass(getMotherboardSlot().getHardwareDescriptionClass());
			for (var i : uint = 0; i < unFittedHardwareItems.length; i++)
			{
				var fitHardwareEntry : FitHardwareEntry = new FitHardwareEntry(getMotherboardSlot(), unFittedHardwareItems[i]);
				getContentLayer().addElement(fitHardwareEntry);
				_layout.addElement(fitHardwareEntry);
			}
			
			_layout.arrange();
		}
		
		public function getUnFittedHardwareItemsWithHardwareDescriptionClass(hardwareDescriptionClass : Class) : Vector.<HardwareItem>
		{
			var unFittedHardwareItemsWithHardwareDescriptionClass : Vector.<HardwareItem> = new Vector.<HardwareItem>();
			for each (var hardwareItem : HardwareItem in BitHacker.getUser().getItemCollection().getItemsWithDescriptionClass(hardwareDescriptionClass))
			{
				if (!hardwareItem.isFitted())
				{
					unFittedHardwareItemsWithHardwareDescriptionClass.push(hardwareItem);
				}
			}
			return unFittedHardwareItemsWithHardwareDescriptionClass;
		}
	}
}
