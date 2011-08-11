package com.bithacker.model.item
{
	public class Item
	{
		private var _description : Description;
		
		public function Item(description : Description)
		{
			super();
			
			_description = description;
		}
		
		public function getDescription() : Description
		{
			return _description;
		}
	}
}