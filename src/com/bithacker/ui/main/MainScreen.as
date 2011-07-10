package com.bithacker.ui.main
{
	import com.bithacker.ui.Panel;
	import com.bithacker.ui.Screen;

	public class MainScreen extends Screen
	{
		private var _bottomPanel : BottomPanel;
		
		public function MainScreen()
		{
			super(0xeeeeee);
			
			initializeBottomPanel();
		}

		private function initializeBottomPanel() : void
		{
			_bottomPanel = new BottomPanel();
			addChild(_bottomPanel);
		}
	}
}