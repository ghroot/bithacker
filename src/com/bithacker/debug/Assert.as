package com.bithacker.debug
{
	public class Assert
	{
		public static function fail(message : String) : void
		{
			Debug.warning("Assert fail: " + message);
			Debug.printStackTrace();
		}
		
		public static function assertTrue(condition : Boolean, message : String) : void
		{
			if (!condition)
			{
				fail(message);
			}
		}
		
		public static function assertFalse(condition : Boolean, message : String) : void
		{
			if (condition)
			{
				fail(message);
			}
		}
		
		public static function assertNull(object : Object, message : String) : void
		{
			if (object != null)
			{
				fail(message);
			}
		}
		
		public static function assertNotNull(object : Object, message : String) : void
		{
			if (object == null)
			{
				fail(message);
			}
		}
		
		public static function assertEqual(object1 : Object, object2 : Object, message : String) : void
		{
			if (object1 != object2)
			{
				fail(message);
			}
		}
		
		public static function assertNotEqual(object1 : Object, object2 : Object, message : String) : void
		{
			if (object1 == object2)
			{
				fail(message);
			}
		}
	}
}