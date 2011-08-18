package com.bithacker.main
{
	import com.bithacker.model.database.Database;
	import com.bithacker.model.item.hardware.CpuItem;
	import com.bithacker.model.item.hardware.MemoryDescription;
	import com.bithacker.model.item.hardware.MemoryItem;
	import com.bithacker.model.item.hardware.MotherboardItem;
	import com.bithacker.model.user.User;
	import com.bithacker.view.ui.MainScreen;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.osflash.signals.natives.NativeSignal;

	[SWF(width = "320", height = "480", frameRate = "60")]
	public class BitHacker extends Sprite
	{
		private static var _user : User;
		private static var _mainScreen : MainScreen;
		
		private var enterFrame : NativeSignal;

		public function BitHacker()
		{
			initialise();
		}

		private function initialise() : void
		{
			enterFrame = new NativeSignal(this, Event.ENTER_FRAME, Event);
			enterFrame.add(onEnterFrame);
			
			_user = new User();
			createDefaultItems();
			
			_mainScreen = new MainScreen();
			addChild(_mainScreen.getDisplayObject());
		}

		public static function getMainScreen() : MainScreen
		{
			return _mainScreen;
		}
		
		public static function getUser() : User
		{
			return _user;
		}
		
		private function createDefaultItems() : void
		{
			var motherboardItem : MotherboardItem = Database.instance.getShopDescriptions()[1].createItem() as MotherboardItem;
			_user.addItem(motherboardItem);
			
			var cpuItem : CpuItem = Database.instance.getShopDescriptions()[2].createItem() as CpuItem;
			_user.addItem(cpuItem);
			cpuItem = Database.instance.getShopDescriptions()[3].createItem() as CpuItem;
			_user.addItem(cpuItem);
			
			var memoryItem : MemoryItem = Database.instance.getShopDescriptions()[6].createItem() as MemoryItem;
			_user.addItem(memoryItem);
			
			motherboardItem.getFreeMotherboardSlotForHardwareDescriptionClass(MemoryDescription).fitHardwareItem(memoryItem);
		}
		
		private function onEnterFrame(event : Event) : void
		{
			tickModel();
			tickView();
		}
		
		private function tickModel() : void
		{
			if (_user != null)
			{
				_user.tick();
			}	
		}
		
		private function tickView() : void
		{
			if (_mainScreen != null)
			{
				_mainScreen.tick();
			}	
		}
	}
}
