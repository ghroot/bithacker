package com.bithacker.model.database
{
	public class Group extends DatabaseNode
	{
		private var _databaseNodes : Vector.<DatabaseNode>;
		
		public function Group(id : uint, name : String)
		{
			super(id, name);
			
			initialise();
		}
		
		private function initialise() : void
		{
			_databaseNodes = new Vector.<DatabaseNode>();
		}
		
		public function addDatabaseNode(databaseNode : DatabaseNode) : void
		{
			_databaseNodes.push(databaseNode);
		}
		
		public function addDatabaseNodes(databaseNodes : Vector.<DatabaseNode>) : void
		{
			_databaseNodes = _databaseNodes.concat(databaseNodes);
		}
		
		public function getDatabaseNodes() : Vector.<DatabaseNode>
		{
			return _databaseNodes;
		}
	}
}