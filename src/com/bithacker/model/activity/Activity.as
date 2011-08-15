package com.bithacker.model.activity
{
	public class Activity
	{
		private var _startTime : Date;

		public function Activity()
		{
		}
		
		public function getActivityName() : String
		{
			return null;
		}
		
		public function start() : void
		{
			_startTime = new Date();
		}
		
		public function isStarted() : Boolean
		{
			return _startTime != null;
		}
		
		public function getActivityDuration() : uint
		{
			return 0;
		}
		
		public function getTimeLeft() : int
		{
			return _startTime.getTime() + getActivityDuration() - new Date().getTime();
		}
		
		public function getPassedTime() : int
		{
			return new Date().getTime() - _startTime.getTime();
		}
		
		public function isComplete() : Boolean
		{
			return isStarted() &&
				getTimeLeft() <= 0;
		}
		
		public function tick() : void
		{
			if (isComplete())
			{
				onComplete();
			}
		}
		
		protected function onComplete() : void
		{
		}
	}
}
