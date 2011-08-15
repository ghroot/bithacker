package com.bithacker.model.database
{
	import com.bithacker.model.database.currency.CreditCost;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.hardware.CpuDescription;
	import com.bithacker.model.item.hardware.HardwareDescription;
	import com.bithacker.model.item.hardware.MemoryDescription;
	import com.bithacker.model.item.hardware.MotherboardDescription;
	import com.bithacker.model.item.hardware.NetworkcardDescription;
	import com.bithacker.model.item.software.SoftwareDescription;

	public class Database
	{
		private static var _instance : Database;
		
		public function Database()
		{
		}
		
		public static function get instance() : Database
		{
			if (_instance == null)
			{
				_instance = new Database();
			}
			return _instance;
		}
		
		public function getShopDescriptions() : Vector.<Description>
		{
			return getHardwareDescriptions().concat(getSoftwareDescriptions());
		}
		
		private function getHardwareDescriptions() : Vector.<Description>
		{
			var hardwareDescriptions : Vector.<Description> = new Vector.<Description>();
			
			var motherboardADescription : MotherboardDescription = new MotherboardDescription("Motherboard A", new CreditCost(100), 1, 1);
			hardwareDescriptions.push(motherboardADescription);
			var motherboardBDescription : MotherboardDescription = new MotherboardDescription("Motherboard B", new CreditCost(500), 2, 2);
			hardwareDescriptions.push(motherboardBDescription);
			
			var cpuADescription : CpuDescription = new CpuDescription("Cpu A", new CreditCost(100), 800);
			hardwareDescriptions.push(cpuADescription);
			var cpuBDescription : CpuDescription = new CpuDescription("Cpu B", new CreditCost(500), 1400);
			hardwareDescriptions.push(cpuBDescription);
			
			var networkcardADescription : NetworkcardDescription = new NetworkcardDescription("Network Card A", new CreditCost(100), 14400);
			hardwareDescriptions.push(networkcardADescription);
			var networkcardBDescription : NetworkcardDescription = new NetworkcardDescription("Network Card B", new CreditCost(500), 28800);
			hardwareDescriptions.push(networkcardBDescription);
			
			var memoryADescription : MemoryDescription = new MemoryDescription("Memory A", new CreditCost(100), 512);
			hardwareDescriptions.push(memoryADescription);
			var memoryBDescription : MemoryDescription = new MemoryDescription("Memory B", new CreditCost(500), 1024);
			hardwareDescriptions.push(memoryBDescription);
			
			return hardwareDescriptions;
		}
		
		private function getSoftwareDescriptions() : Vector.<Description>
		{
			var softwareDescriptions : Vector.<Description> = new Vector.<Description>();
			
			var firewallADescription : SoftwareDescription = new SoftwareDescription("Firewall A", new CreditCost(50), "1.0", 5000);
			softwareDescriptions.push(firewallADescription);
			
			return softwareDescriptions;	
		}
	}
}