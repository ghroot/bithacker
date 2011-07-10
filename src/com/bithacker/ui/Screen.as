package com.bithacker.ui
{
	import flash.geom.Point;

	public class Screen extends Component
	{
		public function Screen(backgroundColor : uint = 0xffffff)
		{
			super(new Point(ScreenSize.WIDTH, ScreenSize.HEIGHT), backgroundColor);
		}
	}
}