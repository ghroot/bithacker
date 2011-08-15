package com.bithacker.model.requirement
{
	public class RequirementCollection
	{
		private var _requirements : Vector.<Requirement>;

		public function RequirementCollection()
		{
			initialise();
		}

		private function initialise() : void
		{
			_requirements = new Vector.<Requirement>();
		}
		
		public function areSatisfied(context : RequirementContext) : Boolean
		{
			for each (var requirement : Requirement in _requirements)
			{
				if (!requirement.isSatisfied(context))
				{
					return false;
				}
			}
			return true;
		}
	}
}
