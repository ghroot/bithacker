package com.bithacker.util
{
	public class DateUtil
	{
		public static function timeToString(time : Number) : String
		{
			if (time % 1000 != 0)
			{
				time += 1000;
			}
			
			var hours : int = time / (1000 * 60 * 60);
			time -= hours * (1000 * 60 * 60);
			var minutes : int = time / (1000 * 60);
			time -= minutes * (1000 * 60);
			var seconds : int = time / 1000;
			
			return StringUtil.fillZeros("" + hours, 2) + ":" + StringUtil.fillZeros("" + minutes, 2) + ":" + StringUtil.fillZeros("" + seconds, 2);
		}
	}
}