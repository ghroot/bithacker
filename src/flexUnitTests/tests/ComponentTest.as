package flexUnitTests.tests
{
	import com.bithacker.view.ui.core.Component;
	
	import flash.geom.Point;
	
	import flexunit.framework.Assert;
	
	public class ComponentTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testComponent() : void
		{
			var component : Component = new Component(new Point(120, 60));
			Assert.assertEquals(120, component.width);
			Assert.assertEquals(60, component.height);
		}
	}
}