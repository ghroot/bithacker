package com.bithacker.view.ui.core
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class ProgressBar extends Element
	{
		private var _barSprite : Sprite;
		
		public function ProgressBar(displayObject : DisplayObject)
		{
			super(displayObject);

			initialise();
		}

		private function initialise() : void
		{
			_barSprite = findChildSpriteWithName("bar");
		}
		
		public function setRatio(ratio : Number) : void
		{
			_barSprite.scaleX = ratio;
		}
	}
}
