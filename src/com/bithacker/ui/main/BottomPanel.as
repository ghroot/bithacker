package com.bithacker.ui.main
{
	import com.bithacker.ui.Button;
	import com.bithacker.ui.Panel;
	import com.bithacker.ui.ScreenSize;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class BottomPanel extends Panel
	{
		private const HEIGHT : uint = 40;
		
		public function BottomPanel()
		{
			super(new Rectangle(0, ScreenSize.HEIGHT - HEIGHT, ScreenSize.WIDTH, HEIGHT), 0xdddddd);
			
			initialiseButtons();
		}

		private function initialiseButtons() : void
		{
			var button1 : Button = new Button(new Point(30, 30), 0xcccccc);
			button1.x = 5;
			button1.y = 5;
			addChild(button1);
			
			var button2 : Button = new Button(new Point(30, 30), 0xcccccc);
			button2.x = 40;
			button2.y = 5;
			addChild(button2);
		}
	}
}