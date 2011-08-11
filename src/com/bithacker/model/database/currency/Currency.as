package com.bithacker.model.database.currency
{
	public class Currency
	{
		private var _amount : int;
		
		public function Currency(amount : int = 0)
		{
			_amount = amount;
		}
		
		public function getAmount() : int
		{
			return _amount;
		}
		
		public function deductAmount(amountToDeduct : uint) : void
		{
			_amount -= amountToDeduct;
		}
	}
}