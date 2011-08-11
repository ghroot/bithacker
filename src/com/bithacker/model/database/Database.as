package com.bithacker.model.database
{
	import com.bithacker.model.database.currency.CreditCost;
	import com.bithacker.model.item.Description;
	import com.bithacker.model.item.hardware.CpuDescription;
	import com.bithacker.model.item.hardware.MemoryDescription;
	import com.bithacker.model.item.hardware.MotherboardDescription;
	import com.bithacker.model.item.hardware.NetworkcardDescription;

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
			var shopDescriptions : Vector.<Description> = new Vector.<Description>();
			
			var motherboardADescription : MotherboardDescription = new MotherboardDescription("Motherboard A", new CreditCost(100), 1, 1);
			shopDescriptions.push(motherboardADescription);
			var motherboardBDescription : MotherboardDescription = new MotherboardDescription("Motherboard B", new CreditCost(500), 2, 2);
			shopDescriptions.push(motherboardBDescription);
			
			var cpuADescription : CpuDescription = new CpuDescription("Cpu A", new CreditCost(100), 800);
			shopDescriptions.push(cpuADescription);
			var cpuBDescription : CpuDescription = new CpuDescription("Cpu B", new CreditCost(500), 1400);
			shopDescriptions.push(cpuBDescription);
			
			var networkcardADescription : NetworkcardDescription = new NetworkcardDescription("Network Card A", new CreditCost(100), 14400);
			shopDescriptions.push(networkcardADescription);
			var networkcardBDescription : NetworkcardDescription = new NetworkcardDescription("Network Card B", new CreditCost(500), 28800);
			shopDescriptions.push(networkcardBDescription);
			
			var memoryADescription : MemoryDescription = new MemoryDescription("Memory A", new CreditCost(100), 512);
			shopDescriptions.push(memoryADescription);
			var memoryBDescription : MemoryDescription = new MemoryDescription("Memory B", new CreditCost(500), 1024);
			shopDescriptions.push(memoryBDescription);
			
			return shopDescriptions;
		}
	}
}