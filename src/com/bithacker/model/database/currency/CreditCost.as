package com.bithacker.model.database.currency
{
	public class CreditCost extends Cost
	{
		public function CreditCost(amount : uint)
		{
			super(amount);
		}

		override public function deduct(context : CostContext) : void
		{
			context.getUser().getCredits().deductAmount(getAmount());
		}
		
		override public function getFriendlyString() : String
		{
			return _amount + " Credits";
		}
		
		override public function toString() : String
		{
			return "[CreditCost:" +
				" amount=" + _amount +
				"]";
		}
	}
}
