package com.bithacker.view.ui.core
{
	import com.bithacker.util.DisplayUtil;
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.osflash.signals.natives.NativeSignal;
	
	public class ScrollArea extends Component
	{
		private var _scrollableLayer : Layer;
		
		private var _mouseDown : NativeSignal;
		private var _mouseUp : NativeSignal;
		private var _mouseMove : NativeSignal;
		private var _enterFrame : NativeSignal;
		
		private var _isDraggingContent : Boolean;
		private var _draggingContentMouseStartPosition : Point;
		private var _draggingContentMouseOffset : Point;
		private var _draggingContentPositionY : Number;
		private var _draggingContentVelY : Number = 0;
		private var _draggingScrollHandle : Sprite;
		
		public function ScrollArea(size : Point, scrollableLayer : Layer)
		{
			super(size, 0);
			
			_scrollableLayer = scrollableLayer;
			
			initialise();
		}
		
		private function initialise() : void
		{
			setMaskArea(new Rectangle(0, 0, size.x, size.y));
			
			addChild(_scrollableLayer);
			
			initialiseScrollHandle();
			
			initialiseSignals();
		}
		
		private function initialiseScrollHandle() : void
		{
			_draggingScrollHandle = DisplayUtil.createSprite(5, 20, 0xdddddd);
			_draggingScrollHandle.x = width - _draggingScrollHandle.width - 1;
			_draggingScrollHandle.alpha = 0;
			addChild(_draggingScrollHandle);	
		}
		
		private function initialiseSignals() : void
		{
			_enterFrame = new NativeSignal(this, Event.ENTER_FRAME, Event);
			_mouseDown = new NativeSignal(this, MouseEvent.MOUSE_DOWN, MouseEvent);
			_mouseUp = new NativeSignal(this, MouseEvent.MOUSE_UP, MouseEvent);
			_mouseMove = new NativeSignal(this, MouseEvent.MOUSE_MOVE, MouseEvent);
			
			_enterFrame.add(onEnterFrame);
			_mouseDown.add(onMouseDown);
			_mouseUp.add(onMouseUp);
			_mouseMove.add(onMouseMove);	
		}
		
		private function destroySignals() : void
		{
			_enterFrame.removeAll();
			_mouseDown.removeAll();
			_mouseUp.removeAll();	
		}
		
		override public function destroy() : void
		{
			super.destroy();
			
			destroySignals();
		}
		
		public function forceContentWithinScreenBounds() : void
		{
			if (isScrollableContentEqualOrSmallerThanScreenBounds())
			{
				_scrollableLayer.y = 0;
			}
			else
			{
				if (_scrollableLayer.y > 0)
				{
					_scrollableLayer.y = 0;
					_draggingContentVelY = 0;
					if (!_isDraggingContent)
					{
						fadeOutScrollBar();
					}
				}
				else if (_scrollableLayer.y < -(_scrollableLayer.height - size.y))
				{
					_scrollableLayer.y = -(_scrollableLayer.height - size.y);
					snapScrollableLayerToNearestPixel();
					_draggingContentVelY = 0;
					if (!_isDraggingContent)
					{
						fadeOutScrollBar();
					}
				}
			}
		}
		
		private function isScrollableContentEqualOrSmallerThanScreenBounds() : Boolean
		{
			return _scrollableLayer.height <= size.y;
		}
		
		private function isScrollableContentLargerThanScreenBounds() : Boolean
		{
			return !isScrollableContentEqualOrSmallerThanScreenBounds();
		}
		
		private function onMouseDown(event : MouseEvent) : void
		{
			if (isScrollableContentLargerThanScreenBounds())
			{
				startScrollDrag();
			}
		}
		
		private function startScrollDrag() : void
		{
			_draggingContentMouseStartPosition = new Point(_scrollableLayer.x, _scrollableLayer.y);
			_draggingContentMouseOffset = new Point(mouseX, mouseY);
			_isDraggingContent = true;
			_draggingContentVelY = 0;	
		}
		
		private function stopScrollDrag() : void
		{
			_draggingContentMouseStartPosition = null;
			_draggingContentMouseOffset = null;
			_isDraggingContent = false;
			_draggingContentVelY = _scrollableLayer.y - _draggingContentPositionY;
			snapScrollableLayerToNearestPixel();
			if (_draggingContentVelY == 0)
			{
				fadeOutScrollBar();
			}	
		}
		
		private function tickScrollDrag() : void
		{
			if (_isDraggingContent)
			{
				_draggingContentPositionY = _scrollableLayer.y;
				_scrollableLayer.y = _draggingContentMouseStartPosition.add(new Point(mouseX, mouseY).subtract(_draggingContentMouseOffset)).y;
			}
			else
			{
				if (_draggingContentVelY != 0)
				{
					_scrollableLayer.y += _draggingContentVelY;
					_draggingContentVelY *= 0.92;
					if (Math.abs(_draggingContentVelY) <= 0.1)
					{
						_draggingContentVelY = 0;
						snapScrollableLayerToNearestPixel();
						fadeOutScrollBar();
					}
				}
			}
			
			forceContentWithinScreenBounds();
			
			_draggingScrollHandle.height = (size.y / _scrollableLayer.height) * size.y - 2;
			_draggingScrollHandle.y = -_scrollableLayer.y / (_scrollableLayer.height / size.y) + 1;	
		}
		
		private function showScrollBar() : void
		{
			TweenLite.killTweensOf(_draggingScrollHandle);
			_draggingScrollHandle.alpha = 1;
		}
		
		private function fadeOutScrollBar() : void
		{
			TweenLite.killTweensOf(_draggingScrollHandle);
			TweenLite.to(_draggingScrollHandle, 0.6, {alpha: 0});
		}
		
		private function snapScrollableLayerToNearestPixel() : void
		{
			_scrollableLayer.y = Math.round(_scrollableLayer.y);
		}
		
		private function onMouseUp(event : MouseEvent) : void
		{
			stopScrollDrag();
		}
		
		private function onMouseMove(event : MouseEvent) : void
		{
			if (_isDraggingContent)
			{
				showScrollBar();
			}
		}
		
		public function onEnterFrame(event : Event) : void
		{
			tickScrollDrag();
		}
	}
}