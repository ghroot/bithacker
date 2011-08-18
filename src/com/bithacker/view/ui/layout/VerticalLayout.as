package com.bithacker.view.ui.layout
{
	public class VerticalLayout extends Layout
	{
		public function VerticalLayout()
		{
			super();
		}
		
		override public function arrange() : void
		{
			var currentY : Number = 0;
			for (var i : uint = 0; i < elements.length; i++)
			{
				elements[i].y = currentY;
				currentY += elements[i].height;
			}
		}
	}
}