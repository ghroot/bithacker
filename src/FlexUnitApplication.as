package
{
	import Array;
	
	import flash.display.Sprite;
	
	import flexUnitTests.MyTestSuite;
	import flexUnitTests.tests.BitHackerTest;
	import flexUnitTests.tests.ComponentTest;
	
	import flexunit.flexui.FlexUnitTestRunnerUIAS;
	
	public class FlexUnitApplication extends Sprite
	{
		public function FlexUnitApplication()
		{
			onCreationComplete();
		}
		
		private function onCreationComplete():void
		{
			var testRunner:FlexUnitTestRunnerUIAS=new FlexUnitTestRunnerUIAS();
			this.addChild(testRunner); 
			testRunner.runWithFlexUnit4Runner(currentRunTestSuite(), "bithacker");
		}
		
		public function currentRunTestSuite():Array
		{
			var testsToRun:Array = new Array();
			testsToRun.push(flexUnitTests.tests.ComponentTest);
			testsToRun.push(flexUnitTests.tests.BitHackerTest);
			testsToRun.push(flexUnitTests.MyTestSuite);
			return testsToRun;
		}
	}
}