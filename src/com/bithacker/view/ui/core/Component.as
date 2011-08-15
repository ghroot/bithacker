package com.bithacker.view.ui.core
{
	import com.bithacker.util.DisplayUtil;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	public class Component extends Sprite
	{
		private var _sprite : Sprite;
		private var _maskSprite : Sprite;
		
		public function Component(sprite : Sprite = null)
		{
			super();
			
			_sprite = sprite;
			
			initialise();
		}
		
		private function initialise() : void
		{
			if (_sprite != null &&
				_sprite.parent == null)
			{
				addChild(_sprite);
			}
		}
		
		public function getSprite() : Sprite
		{
			return _sprite;
		}
		
		public function getSpriteAsMovieClip() : MovieClip
		{
			return getSprite() as MovieClip;
		}
		
		public function isSpriteChild() : Boolean
		{
			return contains(getSprite());
		}
		
		protected function findChildDisplayObjectWithName(name : String) : DisplayObject
		{
			return DisplayUtil.findChildByName(getSprite(), name);
		}
		
		protected function findChildTextFieldWithName(name : String) : TextField
		{
			return findChildDisplayObjectWithName(name) as TextField;
		}
		
		protected function findChildSpriteWithName(name : String) : Sprite
		{
			return findChildDisplayObjectWithName(name) as Sprite;
		}
		
		protected function findChildMovieClipWithName(name : String) : MovieClip
		{
			return findChildDisplayObjectWithName(name) as MovieClip;
		}
		
		public function refresh() : void
		{
			for (var i : uint = 0; i < numChildren; i++)
			{
				var child : DisplayObject = getChildAt(i);
				if (child is Component)
				{
					var component : Component = child as Component;
					component.refresh();
				}
			}
		}
		
		public function destroy() : void
		{
			destroyChildComponents();
		}
		
		protected function getChildComponents() : Vector.<Component>
		{
			var childComponents : Vector.<Component> = new Vector.<Component>();
			for (var i : uint = 0; i < numChildren; i++)
			{
				var child : DisplayObject = getChildAt(i);
				if (child is Component)
				{
					childComponents.push(child);
				}
			}
			return childComponents;
		}
		
		private function destroyChildComponents() : void
		{
			var childComponents : Vector.<Component> = getChildComponents();
			for each (var component : Component in childComponents)
			{
				component.destroy();
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
		
		public function show() : void
		{
			visible = true;
		}
		
		public function hide() : void
		{
			visible = false;
		}
		
		public function tick() : void
		{
			tickChildComponents();
		}
		
		private function tickChildComponents() : void
		{
			var childComponents : Vector.<Component> = getChildComponents();
			childComponents.reverse();
			for each (var component : Component in childComponents)
			{
				component.tick();
			}	
		}
	}
}