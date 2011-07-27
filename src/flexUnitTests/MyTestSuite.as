package flexUnitTests
{
	import flexUnitTests.tests.BitHackerTest;
	import flexUnitTests.tests.ComponentTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MyTestSuite
	{
		public var bitHackerTest : BitHackerTest;
		public var componentTest : ComponentTest;
	}
}