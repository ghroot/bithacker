package com.bithacker.model.user
{
	import com.bithacker.model.database.currency.Cost;
	import com.bithacker.model.database.currency.CostContext;
	import com.bithacker.model.database.currency.Credits;
	import com.bithacker.model.item.Item;

	public class User
	{
		private var _credits : Credits;
		private var _items : Vector.<Item>;
		
		public function User()
		{
			initialise();
		}
		
		private function initialise() : void
		{
			_credits = new Credits();
			_items = new Vector.<Item>();
		}
		
		public function getCredits() : Credits
		{
			return _credits;
		}
		
		public function buy(item : Item) : void
		{
			item.getDescription().getCost().deduct(new CostContext(this));
			_items.push(item);
		}
	}
}