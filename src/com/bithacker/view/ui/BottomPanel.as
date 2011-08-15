package com.bithacker.view.ui
{
	import com.bithacker.view.ui.activity.ActivitySubScreen;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.Panel;
	import com.bithacker.view.ui.core.ScreenSize;
	import com.bithacker.view.ui.hardware.MotherboardSubScreen;
	import com.bithacker.view.ui.shop.ShopListSubScreen;
	
	import flash.geom.Point;
	
	public class BottomPanel extends Panel
	{
		public static const HEIGHT : uint = 60;
		
		public function BottomPanel()
		{
			super(new Point(ScreenSize.WIDTH, HEIGHT), 0xdddddd);
			
			initialise();
		}
		
		private function initialise() : void
		{
			initialiseButtons();
		}

		private function initialiseButtons() : void
		{
			var activityScreenButton : Button = new BottomPanelButton(ActivitySubScreen);
			activityScreenButton.x = 5;
			activityScreenButton.y = 5;
			addChild(activityScreenButton);
			
			var shopScreenButton : Button = new BottomPanelButton(ShopListSubScreen);
			shopScreenButton.x = 60;
			shopScreenButton.y = 5;
			addChild(shopScreenButton);
			
			var mapScreenButton : Button = new BottomPanelButton(MapSubScreen);
			mapScreenButton.x = 115;
			mapScreenButton.y = 5;
			addChild(mapScreenButton);
			
			var motherboardScreenButton : Button = new BottomPanelButton(MotherboardSubScreen);
			motherboardScreenButton.x = 170;
			motherboardScreenButton.y = 5;
			addChild(motherboardScreenButton);
		}
	}
}