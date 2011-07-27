package com.bithacker.view.ui.core
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
	public class Button extends Component
	{
		private static const MAX_MOUSE_POSITION_DISTANCE_FOR_CLICK : uint = 5;
		
		private var _downBackgroundColor : uint;
		
		private var _mouseUp : NativeSignal;
		private var _mouseDown : NativeSignal;
		private var _mouseOut : NativeSignal;
		
		private var _isMouseDown : Boolean;
		private var _mouseDownGlobalPosition : Point;
		
		public var clicked : Signal;
		
		public function Button(size : Point, backgroundColor : uint = 0xffffff, downBackgroundColor : uint = 0xffffff)
		{
			super(size, backgroundColor);
			
			_downBackgroundColor = downBackgroundColor;
			
			initialise();
		}
		
		private function initialise() : void
		{
			_mouseDown = new NativeSignal(this, MouseEvent.MOUSE_DOWN, MouseEvent);
			_mouseUp = new NativeSignal(this, MouseEvent.MOUSE_UP, MouseEvent);
			_mouseOut = new NativeSignal(this, MouseEvent.MOUSE_OUT, MouseEvent);
			clicked = new Signal();
			
			_mouseDown.add(onMouseDown);
			_mouseUp.add(onMouseUp);
			_mouseOut.add(onMouseOut);
			
			useHandCursor = true;
			buttonMode = true;
		}
		
		override public function destroy() : void
		{
			super.destroy();
			
			_mouseDown.removeAll();
			_mouseUp.removeAll();
			_mouseOut.removeAll();
			clicked.removeAll();
		}
		
		private function onMouseDown(event : MouseEvent) : void
		{
			updateBackgroundSpriteWithColor(_downBackgroundColor);
			_mouseDownGlobalPosition = localToGlobal(new Point(mouseX, mouseY));
			_isMouseDown = true;
		}
		
		private function onMouseUp(event : MouseEvent) : void
		{
			if (_isMouseDown)
			{
				updateBackgroundSpriteWithColor(backgroundColor);
				if (isMouseUpPositionCloseToMouseDownPosition())
				{
					clicked.dispatch();
				}
				_isMouseDown = false;
			}
		}
		
		private function onMouseOut(event : MouseEvent) : void
		{
			if (_isMouseDown)
			{
				updateBackgroundSpriteWithColor(backgroundColor);
				_isMouseDown = false;
			}
		}
		
		private function isMouseUpPositionCloseToMouseDownPosition() : Boolean
		{
			return Point.distance(_mouseDownGlobalPosition, localToGlobal(new Point(mouseX, mouseY))) <= MAX_MOUSE_POSITION_DISTANCE_FOR_CLICK;
		}
	}
}