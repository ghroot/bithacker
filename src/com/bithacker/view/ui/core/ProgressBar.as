package com.bithacker.view.ui.core
{
	import com.bithacker.util.DisplayUtil;
	
	import flash.display.Sprite;

	public class ProgressBar extends Component
	{
		private var _barSprite : Sprite;
		
		public function ProgressBar(sprite : Sprite)
		{
			super(sprite);

			initialise();
		}

		private function initialise() : void
		{
			_barSprite = DisplayUtil.findChildByName(getSprite(), "bar") as Sprite;
		}
		
		public function setRatio(ratio : Number) : void
		{
			_barSprite.scaleX = ratio;
		}
	}
}
