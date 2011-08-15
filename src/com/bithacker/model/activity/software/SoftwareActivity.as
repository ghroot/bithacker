package com.bithacker.model.activity.software
{
	import com.bithacker.model.activity.Activity;
	import com.bithacker.model.item.software.SoftwareItem;
	
	public class SoftwareActivity extends Activity
	{
		private var _softwareItem : SoftwareItem;
		
		public function SoftwareActivity(softwareItem : SoftwareItem)
		{
			super();
			
			_softwareItem = softwareItem;
		}

		override public function getActivityName() : String
		{
			return _softwareItem.getDescription().getName() + " " + _softwareItem.getSoftwareDescription().getVersion();
		}
		
		override public function getActivityDuration() : uint
		{
			return _softwareItem.getSoftwareDescription().getRunDuration();
		}
	}
}