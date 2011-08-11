package com.bithacker.model.database.currency
{
	public class Cost
	{
		protected var _amount : uint;

		public function Cost(amount : uint)
		{
			_amount = amount;
		}

		public function getAmount() : uint
		{
			return _amount;
		}
		
		public function deduct(context : CostContext) : void
		{
		}
		
		public function getFriendlyString() : String
		{
			return null;
		}
		
		public function toString() : String
		{
			return "[Cost:" +
				" amount=" + _amount +
				"]";
		}
	}
}
