package com.bithacker.model.database
{
	public class DatabaseNode
	{
		private var _id : uint;
		private var _name : String;
		
		public function DatabaseNode(id : uint, name : String)
		{
			_id = id;
			_name = name;
		}
		
		public function getId() : uint
		{
			return _id;
		}
		
		public function getName() : String
		{
			return _name;
		}
	}
}