package com.bithacker.model.database
{
	import com.bithacker.model.database.currency.CreditCost;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.hardware.CpuDescription;
	import com.bithacker.model.item.hardware.MemoryDescription;
	import com.bithacker.model.item.hardware.MotherboardDescription;
	import com.bithacker.model.item.hardware.NetworkcardDescription;
	import com.bithacker.model.item.software.SoftwareDescription;

	/**
	 * Hardware id ranges:
	 * Motherboards: 10000
	 * Cpu: 11000
	 * Network card: 12000
	 * Memory: 13000
	 * 
	 * Software id ranges:
	 * Firewall: 20000
	 * Password breaker: 21000
	 */
	public class Database
	{
		private static var _instance : Database;
		
		private var _rootGroup : Group;
		private var _hardwareGroup : Group;
		private var _softwareGroup : Group;
		
		public function Database()
		{
			initialise();
		}
		
		private function initialise() : void
		{
			_rootGroup = new Group(0, "Shop");
			
			_hardwareGroup = new Group(1000, "Hardware");
			_hardwareGroup.addDatabaseNodes(Vector.<DatabaseNode>(getHardwareGroups()));
			_rootGroup.addDatabaseNode(_hardwareGroup);
			
			_softwareGroup = new Group(2000, "Software");
			_softwareGroup.addDatabaseNodes(Vector.<DatabaseNode>(getSoftwareGroups()));
			_rootGroup.addDatabaseNode(_softwareGroup);
		}
		
		public function getRootGroup() : Group
		{
			return _rootGroup;
		}
		
		private function getHardwareGroups() : Vector.<Group>
		{
			var hardwareGroups : Vector.<Group> = new Vector.<Group>();
			
			var motherboardGroup : Group = new Group(10000, "Motherboards");
			hardwareGroups.push(motherboardGroup);
			var motherboardADescription : MotherboardDescription = new MotherboardDescription(10001, "Motherboard A", new CreditCost(100), 1, 1);
			motherboardGroup.addDatabaseNode(motherboardADescription);
			var motherboardBDescription : MotherboardDescription = new MotherboardDescription(10002, "Motherboard B", new CreditCost(500), 2, 2);
			motherboardGroup.addDatabaseNode(motherboardBDescription);
			
			var cpuGroup : Group = new Group(11000, "CPUs");
			hardwareGroups.push(cpuGroup);
			var cpuADescription : CpuDescription = new CpuDescription(11001, "Cpu A", new CreditCost(100), 800);
			cpuGroup.addDatabaseNode(cpuADescription);
			var cpuBDescription : CpuDescription = new CpuDescription(11002, "Cpu B", new CreditCost(500), 1400);
			cpuGroup.addDatabaseNode(cpuBDescription);
			
			var networkcardGroup : Group = new Group(12000, "Network Cards");
			hardwareGroups.push(networkcardGroup);
			var networkcardADescription : NetworkcardDescription = new NetworkcardDescription(12001, "Network Card A", new CreditCost(100), 14400);
			networkcardGroup.addDatabaseNode(networkcardADescription);
			var networkcardBDescription : NetworkcardDescription = new NetworkcardDescription(12002, "Network Card B", new CreditCost(500), 28800);
			networkcardGroup.addDatabaseNode(networkcardBDescription);
			
			var memoryGroup : Group = new Group(13000, "Memory");
			hardwareGroups.push(memoryGroup);
			var memoryADescription : MemoryDescription = new MemoryDescription(13001, "Memory A", new CreditCost(100), 512);
			memoryGroup.addDatabaseNode(memoryADescription);
			var memoryBDescription : MemoryDescription = new MemoryDescription(13002, "Memory B", new CreditCost(500), 1024);
			memoryGroup.addDatabaseNode(memoryBDescription);
			
			return hardwareGroups;
		}
		
		private function getSoftwareGroups() : Vector.<Group>
		{
			var softwareGroups : Vector.<Group> = new Vector.<Group>();
			
			var firewallGroup : Group = new Group(20000, "Firewalls");
			softwareGroups.push(firewallGroup);
			var firewallADescription : SoftwareDescription = new SoftwareDescription(20001, "Firewall A", new CreditCost(50), "1.0", 5000);
			firewallGroup.addDatabaseNode(firewallADescription);
			
			var passwordBreakerGroup : Group = new Group(21000, "Password Breakers");
			softwareGroups.push(passwordBreakerGroup);
			var passwordBreakerADescription : SoftwareDescription = new SoftwareDescription(21001, "Password Breaker A", new CreditCost(100), "1.0", 60000);
			passwordBreakerGroup.addDatabaseNode(passwordBreakerADescription);
			
			return softwareGroups;	
		}
		
		public function getDatabaseNodeById(id : uint) : DatabaseNode
		{
			return DatabaseUtil.findDatabaseNodeWithId(_rootGroup, id);
		}
		
		public static function get instance() : Database
		{
			if (_instance == null)
			{
				_instance = new Database();
			}
			return _instance;
		}
	}
}