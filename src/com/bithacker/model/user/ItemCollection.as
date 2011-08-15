package com.bithacker.model.user
{
	import com.bithacker.model.item.Item;

	public class ItemCollection
	{
		private var _items : Vector.<Item>;

		public function ItemCollection()
		{
			initialise();
		}

		private function initialise() : void
		{
			_items = new Vector.<Item>();
		}
		
		public function getItems() : Vector.<Item>
		{
			return _items;
		}
		
		public function addItem(item : Item) : void
		{
			_items.push(item);
		}
		
		public function getItemsWithClass(itemClass : Class) : Vector.<Item>
		{
			var itemsWithClass : Vector.<Item> = new Vector.<Item>();
			for each (var item : Item in getItems())
			{
				if (item is itemClass)
				{
					itemsWithClass.push(item);
				}
			}
			return itemsWithClass;
		}

		public function getFirstItemWithClass(itemClass : Class) : Item
		{
			for each (var item : Item in _items)
			{
				if (item is itemClass)
				{
					return item;
				}
			}
			return null;
		}

		public function getItemsWithDescriptionClass(descriptionClass : Class) : Vector.<Item>
		{
			var itemsWithDescriptionClass : Vector.<Item> = new Vector.<Item>();
			for each (var item : Item in getItems())
			{
				if (item.getDescription() is descriptionClass)
				{
					itemsWithDescriptionClass.push(item);
				}
			}
			return itemsWithDescriptionClass;
		}
		
		public function getFirstItemWithDescriptionClass(descriptionClass : Class) : Item
		{
			for each (var item : Item in _items)
			{
				if (item.getDescription() is descriptionClass)
				{
					return item;
				}
			}
			return null;
		}
	}
}
