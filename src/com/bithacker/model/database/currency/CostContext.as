package com.bithacker.model.database.currency
{
	import com.bithacker.model.user.User;

	public class CostContext
	{
		private var _user : User;
		
		public function CostContext(user : User)
		{
			_user = user;
		}
		
		public function getUser() : User
		{
			return _user;
		}
	}
}