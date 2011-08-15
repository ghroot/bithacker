package com.bithacker.util
{
	public class StringUtil
	{
		public static function fillZeros(s : String, nDigits : int) : String
		{
			while (s.length < nDigits)
			{
				s = "0" + s;
			}
			return s;
		}
	}
}