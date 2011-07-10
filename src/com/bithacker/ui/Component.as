package com.bithacker.ui
{
	import com.bithacker.util.DisplayUtil;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Component extends Sprite
	{
		private var _size : Point;
		private var _backgroundColor : uint;
		private var _backgroundSprite : Sprite;
		
		public function Component(size : Point, backgroundColor : uint = 0xffffff)
		{
			super();
			
			_size = size;
			_backgroundColor = backgroundColor;
			
			addChild(DisplayUtil.createSprite(_size.x, _size.y, _backgroundColor));
		}
	}
}