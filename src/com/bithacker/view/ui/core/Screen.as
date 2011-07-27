package com.bithacker.view.ui.core
{
	import com.bithacker.util.DisplayUtil;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.osflash.signals.natives.NativeSignal;

	public class Screen extends Component
	{
		private var _mouseDown : NativeSignal;
		private var _mouseUp : NativeSignal;
		private var _enterFrame : NativeSignal;
		
		protected var _maskSprite : Sprite;
		protected var _content : Panel;
		protected var _isDraggingContent : Boolean;
		private var _draggingContentMouseStartPosition : Point;
		private var _draggingContentMouseOffset : Point;
		protected var _draggingContentPositionY : Number;
		protected var _draggingContentVelY : Number;
		
		public function Screen(size : Point, backgroundColor : uint = 0xffffff)
		{
			super(size, backgroundColor);
			
			initialise();
		}
		
		private function initialise() : void
		{
			_maskSprite = DisplayUtil.createSprite(size.x, size.y, 0);
			mask = _maskSprite;
			addChild(_maskSprite);
			
			// TODO: Components shouldn't be opaque and have size?
			_content = new Panel(new Point(0, 0), 0);
			addChild(_content);
			
			_enterFrame = new NativeSignal(this, Event.ENTER_FRAME, Event);
			_mouseDown = new NativeSignal(this, MouseEvent.MOUSE_DOWN, MouseEvent);
			_mouseUp = new NativeSignal(this, MouseEvent.MOUSE_UP, MouseEvent);
			
			_enterFrame.add(onEnterFrame);
			_mouseDown.add(onMouseDown);
			_mouseUp.add(onMouseUp);
		}
		
		override public function destroy() : void
		{
			super.destroy();
			
			_enterFrame.removeAll();
			_mouseDown.removeAll();
			_mouseUp.removeAll();
		}
		
		public function getContent() : Sprite
		{
			return _content;
		}
		
		public function forceContentWithinScreenBounds() : void
		{
			_content.y = Math.min(0, _content.y);
			_content.y = Math.max(-(_content.height - size.y), _content.y);
		}
		
		private function onMouseDown(event : MouseEvent) : void
		{
			_draggingContentMouseStartPosition = new Point(_content.x, _content.y);
			_draggingContentMouseOffset = new Point(mouseX, mouseY);
			_isDraggingContent = true;
			_draggingContentVelY = 0;
		}
		
		private function onMouseUp(event : MouseEvent) : void
		{
			_draggingContentMouseStartPosition = null;
			_draggingContentMouseOffset = null;
			_isDraggingContent = false;
			_draggingContentVelY = _content.y - _draggingContentPositionY;
		}
		
		public function onEnterFrame(event : Event) : void
		{
			if (_isDraggingContent)
			{
				_draggingContentPositionY = _content.y;
				_content.y = _draggingContentMouseStartPosition.add(new Point(mouseX, mouseY).subtract(_draggingContentMouseOffset)).y;
			}
			else
			{
				if (_draggingContentVelY != 0)
				{
					_content.y += _draggingContentVelY;
					_draggingContentVelY *= 0.92;
					if (Math.abs(_draggingContentVelY) <= 0.01)
					{
						_draggingContentVelY = 0;
					}
				}
				
			}
			
			forceContentWithinScreenBounds();
		}
	}
}