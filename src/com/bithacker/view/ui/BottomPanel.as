package com.bithacker.view.ui
{
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.activity.ActivitySubScreen;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.Panel;
	import com.bithacker.view.ui.hardware.MotherboardSubScreen;
	import com.bithacker.view.ui.shop.ShopListSubScreen;
	
	public class BottomPanel extends Panel
	{
		public static const HEIGHT : uint = 60;
		
		private var _buttons : Vector.<BottomPanelButton>;
		
		public function BottomPanel()
		{
			super(DisplayUtil.createSpriteFromName("BottomPanelScene"));
			
			initialise();
		}
		
		private function initialise() : void
		{
			initialiseButtons();
		}

		private function initialiseButtons() : void
		{
			_buttons = new Vector.<BottomPanelButton>();
			
			var motherboardScreenButton : Button = new BottomPanelButton(findChildMovieClipWithName("motherboardButton"), MotherboardSubScreen, "COM");
			_buttons.push(motherboardScreenButton);
			
			var shopScreenButton : Button = new BottomPanelButton(findChildMovieClipWithName("shopButton"), ShopListSubScreen, "SHO");
			_buttons.push(shopScreenButton);
			
			var activityScreenButton : Button = new BottomPanelButton(findChildMovieClipWithName("activityButton"), ActivitySubScreen, "ACT");
			_buttons.push(activityScreenButton);
		}
	}
}