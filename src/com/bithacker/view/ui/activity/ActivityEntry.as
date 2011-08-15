package com.bithacker.view.ui.activity
{
	import com.bithacker.main.BitHacker;
	import com.bithacker.model.activity.Activity;
	import com.bithacker.util.DateUtil;
	import com.bithacker.util.DisplayUtil;
	import com.bithacker.view.ui.core.Button;
	import com.bithacker.view.ui.core.ProgressBar;
	import com.bithacker.view.ui.core.text.WrappedTextField;
	
	import flash.display.Sprite;
	import flash.text.TextField;

	public class ActivityEntry extends Button
	{
		private var _activity : Activity;
		private var _nameTextField : WrappedTextField;
		private var _timeTextField : WrappedTextField;
		private var _percentTextField : WrappedTextField;
		private var _progressBar : ProgressBar;
		private var _activitySubScreen : ActivitySubScreen;
		
		public function ActivityEntry(activitySubScreen : ActivitySubScreen, activity : Activity)
		{
			super(DisplayUtil.createMovieClipFromName("ActivityEntryScene"));
			
			_activitySubScreen = activitySubScreen;
			_activity = activity;
			
			initialise();
		}
		
		private function initialise() : void
		{
			clicked.add(onClick);
			
			_nameTextField = new WrappedTextField(DisplayUtil.findChildByName(this, "nameTextField") as TextField);
			_timeTextField = new WrappedTextField(DisplayUtil.findChildByName(this, "timeTextField") as TextField);
			_percentTextField = new WrappedTextField(DisplayUtil.findChildByName(this, "percentTextField") as TextField);
			
			_progressBar = new ProgressBar(DisplayUtil.findChildByName(this, "progressBar") as Sprite);
			
			refresh();
		}
		
		public function getActivity() : Activity
		{
			return _activity;
		}
		
		override public function destroy() : void
		{
			super.destroy();
			
			clicked.removeAll();
		}
		
		override public function refresh() : void
		{
			super.refresh();
			
			_nameTextField.text = getActivity().getActivityName();
			refreshTimeTextField();
		}
		
		private function refreshTimeTextField() : void
		{
			_timeTextField.text = DateUtil.timeToString(Math.max(0 , _activity.getTimeLeft()));
			_percentTextField.text = Math.min(100, Math.floor(100 * _activity.getPassedTime() / _activity.getActivityDuration())) + "%";
			_progressBar.setRatio(Math.min(1, _activity.getPassedTime() / _activity.getActivityDuration()));
		}
		
		override public function tick() : void
		{
			super.tick();
			
			refreshTimeTextField();
		}
		
		private function onClick() : void
		{
			if (getActivity().isComplete())
			{
				BitHacker.getUser().removeActivity(getActivity());
				_activitySubScreen.initialiseActivityEntries();
			}
		}
	}
}
