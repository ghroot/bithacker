package com.bithacker.view.ui.core
{
	import com.bithacker.util.DisplayUtil;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class Component extends Sprite
	{
		protected var size : Point;
		protected var backgroundColor : uint;
		private var _backgroundSprite : Sprite;
		private var _maskSprite : Sprite;
		
		public function Component(size : Point, backgroundColor : uint = 0xffffff)
		{
			super();
			
			this.size = size;
			this.backgroundColor = backgroundColor;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_backgroundSprite = DisplayUtil.createSprite(size.x, size.y, backgroundColor);
			addChild(_backgroundSprite);
		}
		
		public function destroy() : void
		{
			destroyChildComponents();
		}
		
		private function destroyChildComponents() : void
		{
			for (var i : int = numChildren - 1; i >= 0; i--)
			{
				var child : DisplayObject = getChildAt(i);
				if (child is Component)
				{
					Component(child).destroy();
				}
			}
		}
		
		protected function setMaskArea(rect : Rectangle) : void
		{
			_maskSprite = DisplayUtil.createSprite(rect.width, rect.height, 0);
			_maskSprite.x = rect.x;
			_maskSprite.y = rect.y;
			mask = _maskSprite;
			addChild(_maskSprite);
		}
		
		protected function updateBackgroundSpriteWithColor(color : uint) : void
		{
			Shape(_backgroundSprite.getChildAt(0)).graphics.beginFill(color);
			Shape(_backgroundSprite.getChildAt(0)).graphics.drawRect(0, 0, size.x, size.y);
			Shape(_backgroundSprite.getChildAt(0)).graphics.endFill();	
		}
		
		public function show() : void
		{
			visible = true;
		}
		
		public function hide() : void
		{
			visible = false;
		}
	}
}