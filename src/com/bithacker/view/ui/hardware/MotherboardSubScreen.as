package com.bithacker.view.ui.hardware
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.item.hardware.MotherboardItem;
	import com.bithacker.model.item.hardware.MotherboardSlot;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.layout.Layout;
	import com.bithacker.view.ui.layout.VerticalLayout;

	public class MotherboardSubScreen extends SubScreen
	{
		private var _layout : Layout;
		private var _motherboardItem : MotherboardItem;
		private var _motherboardSlots : Vector.<MotherboardSlot>;
		
		public function MotherboardSubScreen()
		{
			super();
			
			initialise();
		}
		
		private function initialise() : void
		{
			_layout = new VerticalLayout();
			
			var motherboardItem : MotherboardItem = BitHacker.getUser().getItemCollection().getFirstItemWithClass(MotherboardItem) as MotherboardItem;
			_motherboardSlots = motherboardItem.getMotherboardSlots();
			
			initialiseMotherboardSlotEntries();
		}
		
		private function initialiseMotherboardSlotEntries() : void
		{
			for (var i : uint = 0; i < _motherboardSlots.length; i++)
			{
				var motherboardSlotEntry : MotherboardSlotEntry = new MotherboardSlotEntry(_motherboardSlots[i]);
				getContentLayer().addElement(motherboardSlotEntry);
				_layout.addElement(motherboardSlotEntry);
			}
			
			_layout.arrange();
		}
		
		override public function getTitleText() : String
		{
			return "Computer";
		}
	}
}
