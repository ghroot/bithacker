package com.bithacker.model.database
{
	public class DatabaseUtil
	{
		public static function findDatabaseNodeWithId(rootDatabaseNode : DatabaseNode, id : uint) : DatabaseNode
		{
			if (rootDatabaseNode.getId() == id)
			{
				return rootDatabaseNode;
			}
			
			if (rootDatabaseNode is Group)
			{
				var group : Group = rootDatabaseNode as Group;
				for each (var databaseNode : DatabaseNode in group.getDatabaseNodes())
				{
					var foundDatabaseNode : DatabaseNode = findDatabaseNodeWithId(databaseNode, id);
					if (foundDatabaseNode != null)
					{
						return foundDatabaseNode;
					}
				}
			}
			
			return null;
		}
	}
}