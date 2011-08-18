package com.bithacker.view.ui.core
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
	public class Button extends Element
	{
		private static const MAX_MOUSE_POSITION_DISTANCE_FOR_CLICK : uint = 5;
		
		private var _mouseUp : NativeSignal;
		private var _mouseDown : NativeSignal;
		private var _mouseMove : NativeSignal;
		private var _mouseOut : NativeSignal;
		
		private var _buttonState : uint;
		private var _buttonStateToLabelMapping : Dictionary;
		private var _mouseDownGlobalPosition : Point;
		
		public var clicked : Signal;
		
		public function Button(displayObject : DisplayObject)
		{
			super(displayObject);
			
			initialise();
		}
		
		private function initialise() : void
		{
			initialiseSignals();
			
			_buttonStateToLabelMapping = new Dictionary();
			_buttonStateToLabelMapping[ButtonState.UP] = "up";
			_buttonStateToLabelMapping[ButtonState.DOWN] = "down";
			
			getDisplayObjectAsSprite().useHandCursor = true;
			getDisplayObjectAsSprite().buttonMode = true;
			
			setButtonState(ButtonState.UP);
		}
		
		private function initialiseSignals() : void
		{
			_mouseDown = new NativeSignal(getDisplayObject(), MouseEvent.MOUSE_DOWN, MouseEvent);
			_mouseUp = new NativeSignal(getDisplayObject(), MouseEvent.MOUSE_UP, MouseEvent);
			_mouseMove = new NativeSignal(getDisplayObject(), MouseEvent.MOUSE_MOVE, MouseEvent);
			_mouseOut = new NativeSignal(getDisplayObject(), MouseEvent.MOUSE_OUT, MouseEvent);
			clicked = new Signal();
			
			_mouseDown.add(onMouseDown);
			_mouseUp.add(onMouseUp);
			_mouseMove.add(onMouseMove);
			_mouseOut.add(onMouseOut);	
		}
		
		private function destroySignals() : void
		{
			_mouseDown.removeAll();
			_mouseUp.removeAll();
			_mouseOut.removeAll();
			clicked.removeAll();	
		}
		
		override public function destroy() : void
		{
			super.destroy();
			
			destroySignals();
		}
		
		public function getButtonState() : uint
		{
			return _buttonState;
		}
		
		private function setButtonState(buttonState : uint) : void
		{
			_buttonState = buttonState;
			
			if (getDisplayObjectAsMovieClip() != null)
			{
				getDisplayObjectAsMovieClip().gotoAndStop(_buttonStateToLabelMapping[_buttonState]);
			}
		}
		
		private function onMouseDown(event : MouseEvent) : void
		{
			_mouseDownGlobalPosition = getDisplayObject().localToGlobal(new Point(getDisplayObject().mouseX, getDisplayObject().mouseY));
			setButtonState(ButtonState.DOWN);
		}
		
		private function onMouseUp(event : MouseEvent) : void
		{
			if (getButtonState() == ButtonState.DOWN)
			{
				if (isCurrentMousePositionCloseToMouseDownPosition())
				{
					clicked.dispatch();
				}
				setButtonState(ButtonState.UP);
			}
		}
		
		private function onMouseMove(event : MouseEvent) : void
		{
			if (getButtonState() == ButtonState.DOWN)
			{
				if (!isCurrentMousePositionCloseToMouseDownPosition())
				{
					setButtonState(ButtonState.UP);
				}
			}
		}
		
		private function onMouseOut(event : MouseEvent) : void
		{
			if (getButtonState() == ButtonState.DOWN)
			{
				setButtonState(ButtonState.UP);
			}
		}
		
		private function isCurrentMousePositionCloseToMouseDownPosition() : Boolean
		{
			return Point.distance(_mouseDownGlobalPosition, getDisplayObject().localToGlobal(new Point(getDisplayObject().mouseX, getDisplayObject().mouseY))) <= MAX_MOUSE_POSITION_DISTANCE_FOR_CLICK;
		}
	}
}