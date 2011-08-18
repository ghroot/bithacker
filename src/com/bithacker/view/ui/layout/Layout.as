package com.bithacker.view.ui.layout
{
	import com.bithacker.view.ui.core.Element;

	public class Layout
	{
		protected var elements : Vector.<Element>;

		public function Layout()
		{
			initialise();
		}

		private function initialise() : void
		{
			elements = new Vector.<Element>();
		}
		
		public function addElement(element : Element) : void
		{
			elements.push(element);
		}
		
		public function removeElement(element : Element) : void
		{
			elements.splice(elements.indexOf(element), 1);
		}

		public function arrange() : void
		{
		}
	}
}
