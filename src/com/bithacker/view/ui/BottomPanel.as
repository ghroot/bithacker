package com.bithacker.view.ui
{
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.Panel;
	import com.bithacker.view.ui.core.ScreenSize;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
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
			var infoScreenButton : Button = new BottomPanelButton(InfoSubScreen);
			infoScreenButton.x = 5;
			infoScreenButton.y = 5;
			addChild(infoScreenButton);
			
			var shopScreenButton : Button = new BottomPanelButton(ShopSubScreen);
			shopScreenButton.x = 60;
			shopScreenButton.y = 5;
			addChild(shopScreenButton);
			
			var mapScreenButton : Button = new BottomPanelButton(MapSubScreen);
			mapScreenButton.x = 115;
			mapScreenButton.y = 5;
			addChild(mapScreenButton);
		}
	}
}