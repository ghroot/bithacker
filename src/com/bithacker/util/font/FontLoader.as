package com.bithacker.util.font
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.text.Font;

	public class FontLoader extends EventDispatcher
	{
		public function FontLoader()
		{
			initialise();
		}
		
		public function initialise() : void
		{
			loadFont("FixedFont.swf");
		}

		private function loadFont(url : String) : void
		{
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, fontLoaded);
			loader.load(new URLRequest(url));
		}

		private function fontLoaded(event : Event) : void
		{
			var FontLibrary : Class = event.target.applicationDomain.getDefinition("com.bithacker.util.font.FixedFont") as Class;
			Font.registerFont(FontLibrary.FixedFont);
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}
