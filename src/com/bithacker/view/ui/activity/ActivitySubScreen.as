package com.bithacker.view.ui.activity
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.activity.Activity;
	import com.bithacker.view.ui.SubScreen;
	import com.bithacker.view.ui.layout.Layout;
	import com.bithacker.view.ui.layout.VerticalLayout;

	public class ActivitySubScreen extends SubScreen
	{
		private var _layout : Layout;
		private var _activityEntries : Vector.<ActivityEntry>;
		
		public function ActivitySubScreen()
		{
			super();
			
			initialise();
		}
		
		private function initialise() : void
		{
			_layout = new VerticalLayout();
			
			initialiseActivityEntries();
		}
		
		public function initialiseActivityEntries() : void
		{
			if (_activityEntries != null)
			{
				for each (var activityEntry : ActivityEntry in _activityEntries)
				{
					removeActivityEntry(activityEntry);
				}
			}
			
			_activityEntries = new Vector.<ActivityEntry>();
			
			var activities : Vector.<Activity> = BitHacker.getUser().getActivities();
			for (var i : uint = 0; i < activities.length; i++)
			{
				addActivityEntry(new ActivityEntry(this, activities[i]));
			}
			
			_layout.arrange();
		}
		
		private function addActivityEntry(activityEntry : ActivityEntry) : void
		{
			getContentLayer().addElement(activityEntry);
			_layout.addElement(activityEntry);
			_activityEntries.push(activityEntry);
		}
		
		private function removeActivityEntry(activityEntry : ActivityEntry) : void
		{
			getContentLayer().removeElement(activityEntry);
			_layout.removeElement(activityEntry);
			activityEntry.destroy();
		}
	}
}
