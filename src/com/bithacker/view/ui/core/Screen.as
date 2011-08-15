package com.bithacker.view.ui.core
{
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class Screen extends Component
	{
		private var _size : Point;
		private var _contentLayer : Layer;
		private var _scrollArea : ScrollArea;
		
		public function Screen(size : Point)
		{
			super();
			
			_size = size;
			
			initialise();
		}
		
		private function initialise() : void
		{
			setMaskArea(new Rectangle(0, 0, _size.x, _size.y));
			
			_contentLayer = new Layer();
			
			_scrollArea = new ScrollArea(_size.clone(), _contentLayer);
			addChild(_scrollArea);
		}
		
		public function getContentLayer() : Layer
		{
			return _contentLayer;
		}
	}
}