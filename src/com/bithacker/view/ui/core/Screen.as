package com.bithacker.view.ui.core
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class Screen extends Element
	{
		private var _size : Point;
		private var _contentLayer : Layer;
		private var _scrollArea : ScrollArea;
		
		public function Screen(size : Point)
		{
			super(new Sprite());
			
			_size = size;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_contentLayer = new Layer();
			
			setMaskArea(new Rectangle(0, 0, _size.x, _size.y));
			
			updateScrollAreaFromSize();
		}
		
		public function getContentLayer() : Layer
		{
			return _contentLayer;
		}
		
		private function updateScrollAreaFromSize() : void
		{
			if (_scrollArea != null)
			{
				_scrollArea.destroy();
				removeElement(_scrollArea);
				_scrollArea = null;
			}
			_scrollArea = new ScrollArea(_size.clone(), _contentLayer);
			addElement(_scrollArea);
		}
	}
}