package com.bithacker.view.ui.core
{
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class Screen extends Component
	{
		private var _contentLayer : Layer;
		private var _scrollArea : ScrollArea;
		
		public function Screen(size : Point, backgroundColor : uint = 0xffffff)
		{
			super(size, backgroundColor);
			
			initialise();
		}
		
		private function initialise() : void
		{
			setMaskArea(new Rectangle(0, 0, size.x, size.y));
			
			_contentLayer = new Layer(new Point(0, 0));
			
			_scrollArea = new ScrollArea(size.clone(), _contentLayer);
			addChild(_scrollArea);
		}
		
		public function getContentLayer() : Layer
		{
			return _contentLayer;
		}
	}
}