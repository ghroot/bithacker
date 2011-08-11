package com.bithacker.debug
{
	public class Debug
	{
		public static function info(message : String) : void
		{
			trace("INFO: " + message);
		}
		
		public static function warning(message : String) : void
		{
			trace("WARNING: " + message);
		}
		
		public static function error(message : String) : void
		{
			trace("ERROR: " + message);
		}
		
		public static function printStackTrace() : void
		{
			trace(new Error().getStackTrace());
		}
	}
}