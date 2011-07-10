package com.bithacker.ui
{
	import flash.geom.Rectangle;

	public class Panel extends Component
	{
		public function Panel(bounds : Rectangle, backgroundColor : uint = 0xffffff)
		{
			super(bounds.size, backgroundColor);
			
			x = bounds.x;
			y = bounds.y;
		}
	}
}