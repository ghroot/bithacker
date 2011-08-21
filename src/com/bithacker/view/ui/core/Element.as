package com.bithacker.view.ui.core
{
	import com.bithacker.debug.Assert;
	import com.bithacker.util.DisplayUtil;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;

	public class Element
	{
		private var _childElements : Vector.<Element>;
		private var _displayObject : DisplayObject;
		private var _maskSprite : Sprite;

		public function Element(displayObject : DisplayObject)
		{
			super();

			_displayObject = displayObject;

			initialise();
		}

		private function initialise() : void
		{
			_childElements = new Vector.<Element>();
		}

		public function getDisplayObject() : DisplayObject
		{
			return _displayObject;
		}
		
		public function getDisplayObjectAsDisplayObjectContainer() : DisplayObjectContainer
		{
			return getDisplayObject() as DisplayObjectContainer;
		}
		
		public function getDisplayObjectAsSprite() : Sprite
		{
			return getDisplayObject() as Sprite;
		}

		public function getDisplayObjectAsMovieClip() : MovieClip
		{
			return getDisplayObject() as MovieClip;
		}
		
		protected function findChildDisplayObjectWithName(name : String) : DisplayObject
		{
			return DisplayUtil.findChildByName(getDisplayObject(), name);
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
		
		public function addElement(element : Element) : void
		{
			_childElements.push(element);
			
			if (element.getDisplayObject().parent == null)
			{
				getDisplayObjectAsDisplayObjectContainer().addChild(element.getDisplayObject());
			}
		}
		
		public function removeElement(element : Element) : void
		{
			if (CONFIG::DEBUG)
			{
				Assert.assertTrue(_childElements.indexOf(element) != -1, "Trying to remove element that is not a child");
			}
			
			_childElements.splice(_childElements.indexOf(element), 1);
			
			if (element.getDisplayObject().parent == getDisplayObject())
			{
				getDisplayObjectAsDisplayObjectContainer().removeChild(element.getDisplayObject());
			}
		}

		public function refresh() : void
		{
			refreshChildElements();
		}
		
		private function refreshChildElements() : void
		{
			for each (var childElement : Element in _childElements)
			{
				childElement.refresh();
			}
		}

		public function destroy() : void
		{
			destroyChildElements();
		}

		private function destroyChildElements() : void
		{
			for (var i : int = _childElements.length - 1; i >= 0; i--)
			{
				_childElements[i].destroy();
			}
		}

		protected function setMaskArea(rect : Rectangle) : void
		{
			if (CONFIG::DEBUG)
			{
				Assert.assertNotNull(getDisplayObjectAsDisplayObjectContainer(), "Can only set mask on Element if display object is DisplayObjectContainer");
			}
			
			if (_maskSprite != null)
			{
				getDisplayObjectAsDisplayObjectContainer().removeChild(_maskSprite);
				_maskSprite = null;
			}
			
			_maskSprite = DisplayUtil.createSprite(rect.width, rect.height, 0);
			_maskSprite.x = rect.x;
			_maskSprite.y = rect.y;
			getDisplayObject().mask = _maskSprite;
			getDisplayObjectAsDisplayObjectContainer().addChild(_maskSprite);
		}

		public function tick() : void
		{
			tickChildElements();
		}

		private function tickChildElements() : void
		{
			for (var i : int = _childElements.length - 1; i >= 0; i--)
			{
				_childElements[i].tick();
			}
		}
		
		
		/**
		 * Wrap Sprite properties
		 */
		
		public function get x() : Number
		{
			return getDisplayObject().x;
		}
		
		public function set x(value : Number) : void
		{
			getDisplayObject().x = value;
		}
		
		public function get y() : Number
		{
			return getDisplayObject().y;
		}
		
		public function set y(value : Number) : void
		{
			getDisplayObject().y = value;
		}
		
		public function get width() : Number
		{
			return getDisplayObject().width;
		}
		
		public function set width(value : Number) : void
		{
			getDisplayObject().width = value;
		}
		
		public function get height() : Number
		{
			return getDisplayObject().height;
		}
		
		public function set height(value : Number) : void
		{
			getDisplayObject().height = value;
		}
		
		public function get visible() : Boolean
		{
			return getDisplayObject().visible;
		}
		
		public function set visible(value : Boolean) : void
		{
			getDisplayObject().visible = value;
		}
		
		public function hide() : void
		{
			visible = false;
		}
		
		public function show() : void
		{
			visible = true;
		}
		
		public function get alpha() : Number
		{
			return getDisplayObject().alpha;
		}
		
		public function set alpha(value : Number) : void
		{
			getDisplayObject().alpha = value;
		}
	}
}
