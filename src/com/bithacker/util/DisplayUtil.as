package com.bithacker.util
{
	import com.bithacker.debug.Debug;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;

	public class DisplayUtil
	{
		public static function createMovieClipFromName(name : String) : MovieClip
		{
			try
			{
				var mcClass : Class = getDefinitionByName(name) as Class;
				return new mcClass();
			} 
			catch (e : Error)
			{
				if (CONFIG::DEBUG)
				{
					Debug.warning("Could not load MovieClip: " + name);
				}
			}
			return null;
		}
		
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
		
		public static function findChildByName(root : DisplayObject, name : String, levels : int = -1) : DisplayObject
		{
			if (root == null)
			{
				return null;
			}
			else if (root.name == name)
			{
				// Match found. Return this object.
				return root;
			}
			else if (levels == 0)
			{
				return null;
			}
			else if (root is DisplayObjectContainer)
			{
				// Root is a container. Recurse into children.
				var container : DisplayObjectContainer = root as DisplayObjectContainer;
				var result : DisplayObject;
				for (var i : int = 0; i < container.numChildren; i++)
				{
					result = findChildByName(container.getChildAt(i), name, levels == -1 ? -1 : levels - 1);
					if (result != null)
					{
						return result;
					}
				}
			}
			
			// No matches found
			return null;
		}
	}
}