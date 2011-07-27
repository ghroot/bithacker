package com.bithacker.view.ui
{
	
	import flash.geom.Point;
	import com.bithacker.view.ui.core.Screen;
	import com.bithacker.view.ui.core.ScreenSize;
	
	public class SubScreen extends Screen
	{
		public function SubScreen(backgroundColor : uint = 0xffffff)
		{
			super(new Point(ScreenSize.WIDTH, ScreenSize.HEIGHT - BottomPanel.HEIGHT), backgroundColor);
		}
	}
}