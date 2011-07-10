package com.bithacker.ui
{
	import flash.geom.Point;
	
	public class Button extends Component
	{
		public function Button(size:Point, backgroundColor : uint = 0xffffff)
		{
			super(size, backgroundColor);
			
			useHandCursor = true;
			buttonMode = true;
		}
	}
}