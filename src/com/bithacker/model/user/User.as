package com.bithacker.model.user
{
	import com.bithacker.model.activity.Activity;
	import com.bithacker.model.database.currency.CostContext;
	import com.bithacker.model.database.currency.Credits;
	import com.bithacker.model.item.Item;

	public class User
	{
		private var _credits : Credits;
		private var _itemCollection : ItemCollection;
		private var _activities : Vector.<Activity>;

		public function User()
		{
			initialise();
		}

		private function initialise() : void
		{
			_credits = new Credits();
			_itemCollection = new ItemCollection();
			_activities = new Vector.<Activity>();
		}

		public function getCredits() : Credits
		{
			return _credits;
		}

		public function getItemCollection() : ItemCollection
		{
			return _itemCollection;
		}

		public function getActivities() : Vector.<Activity>
		{
			return _activities;
		}

		public function buy(item : Item) : void
		{
			item.getDescription().getCost().deduct(new CostContext(this));
			addItem(item);
		}

		public function addItem(item : Item) : void
		{
			_itemCollection.addItem(item);
		}

		public function addAndStartActivity(activity : Activity) : void
		{
			_activities.push(activity);
			activity.start();
		}
		
		public function removeActivity(activity : Activity) : void
		{
			_activities.splice(_activities.indexOf(activity), 1);
		}

		public function tick() : void
		{
			for each (var activity : Activity in getActivities())
			{
				activity.tick();
			}
		}
	}
}
