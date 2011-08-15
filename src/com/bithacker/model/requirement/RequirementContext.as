package com.bithacker.model.requirement
{
	import com.bithacker.model.user.User;

	public class RequirementContext
	{
		private var _user : User;
		
		public function RequirementContext(user : User)
		{
			_user = user;
		}
		
		public function getUser() : User
		{
			return _user;
		}
	}
}