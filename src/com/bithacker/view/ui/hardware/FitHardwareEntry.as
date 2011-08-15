package com.bithacker.view.ui.hardware
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.item.hardware.HardwareItem;
	import com.bithacker.model.item.hardware.MotherboardSlot;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.display.Sprite;
	import flash.geom.Point;

	public class FitHardwareEntry extends Button
	{
		private var _motherboardSlot : MotherboardSlot;
		private var _hardwareItem : HardwareItem;
		private var _textField : WrappedTextField;
		
		public function FitHardwareEntry(motherboardSlot : MotherboardSlot, hardwareItem : HardwareItem)
		{
			super(DisplayUtil.createSprite(ScreenSize.WIDTH, 80, 0xbbbbbb));
			
			_motherboardSlot = motherboardSlot;
			_hardwareItem = hardwareItem;
			
			initialise();
		}
		
		private function initialise() : void
		{
			clicked.add(onClick);
			
			_textField = new WrappedTextField();
			_textField.width = width;
			_textField.height = 60;
			_textField.setFont("wendy");
			_textField.setSize(20);
			addChild(_textField);
			
			var borderSprite : Sprite = new Sprite();
			borderSprite.graphics.lineStyle(1, 0);
			borderSprite.graphics.drawRect(0, 0, width - 1, height - 1);
			addChild(borderSprite);
			
			refresh();
		}
		
		public function getMotherboardSlot() : MotherboardSlot
		{
			return _motherboardSlot;
		}
		
		public function getHardwareItem() : HardwareItem
		{
			return _hardwareItem;
		}
		
		override public function refresh() : void
		{
			super.refresh();
			
			_textField.text = getHardwareItem().getHardwareDescription().getName();
		}
		
		private function onClick() : void
		{
			getMotherboardSlot().fitHardwareItem(getHardwareItem());
			BitHacker.getMainScreen().goToPreviousScreen();
		}
	}
}
