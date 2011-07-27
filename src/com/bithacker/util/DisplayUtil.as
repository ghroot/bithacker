package com.bithacker.util
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class DisplayUtil
	{
		public static function createSprite(width : int, height : int, color : uint) : Sprite
		{
			var sprite : Sprite = new Sprite();
			var shape : Shape = new Shape();
			shape.graphics.beginFill(color);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			sprite.addChild(shape);
			return sprite;
		}
	}
}