package com.bithacker.view.ui
{
	import com.bithacker.view.ui.core.Screen;
	import com.bithacker.view.ui.core.ScreenSize;
	
	import flash.geom.Point;
	
	public class SubScreen extends Screen
	{
		public function SubScreen(backgroundColor : uint = 0xffffff)
		{
			super(new Point(ScreenSize.WIDTH, ScreenSize.HEIGHT - TopPanel.HEIGHT - BottomPanel.HEIGHT), backgroundColor);
			
			initialise();
		}
		
		private function initialise() : void
		{
		}
	}
}