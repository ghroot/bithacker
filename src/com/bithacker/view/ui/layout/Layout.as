package com.bithacker.view.ui.layout
{
	import com.bithacker.view.ui.core.Component;

	public class Layout
	{
		protected var components : Vector.<Component>;

		public function Layout()
		{
			initialise();
		}

		private function initialise() : void
		{
			components = new Vector.<Component>();
		}
		
		public function addComponent(component : Component) : void
		{
			components.push(component);
		}
		
		public function removeComponent(component : Component) : void
		{
			components.splice(components.indexOf(component), 1);
		}

		public function arrange() : void
		{
		}
	}
}
