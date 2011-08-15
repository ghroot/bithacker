package com.bithacker.view.ui.core
{
	import com.bithacker.util.DisplayUtil;
	
	import flash.geom.Point;
	
	public class Panel extends Component
	{
		public function Panel(size : Point, backgroundColor : uint = 0xffffff)
		{
			super(DisplayUtil.createSprite(size.x, size.y, backgroundColor));
		}
	}
}