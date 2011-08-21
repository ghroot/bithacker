package com.bithacker.view.ui.hardware
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.item.hardware.MotherboardSlot;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.display.Sprite;
	import flash.text.TextField;

	public class MotherboardSlotEntry extends Button
	{
		private var _motherboardSlot : MotherboardSlot;
		private var _textField : WrappedTextField;
		
		public function MotherboardSlotEntry(motherboardSlot : MotherboardSlot)
		{
			super(DisplayUtil.createMovieClipFromName("MotherboardSlotEntryScene"));
			
			_motherboardSlot = motherboardSlot;
			
			initialise();
		}
		
		private function initialise() : void
		{
			clicked.add(onClick);
			
			_textField = new WrappedTextField(findChildTextFieldWithName("textField"));
			
			refresh();
		}
		
		override public function refresh() : void
		{
			super.refresh();
			
			if (_motherboardSlot.hasHardwareItemFitted())
			{
				_textField.text = _motherboardSlot.getFittedHardwareItem().getHardwareDescription().getName();
			}
			else
			{
				_textField.text = "<empty> " + _motherboardSlot.getHardwareDescriptionClass().toString();
			}
		}
		
		public function getMotherboardSlot() : MotherboardSlot
		{
			return _motherboardSlot;
		}
		
		private function onClick() : void
		{
			if (getMotherboardSlot().hasHardwareItemFitted())
			{
				getMotherboardSlot().removeFittedHardwareItem();
				refresh();
			}
			else
			{
				BitHacker.getMainScreen().setNextSubScreen(new FitHardwareSubScreen(getMotherboardSlot()));
			}
		}
	}
}
