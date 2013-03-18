package 
{
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.utils.setTimeout;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	[SWF(width="960", height="560", frameRate="60", backgroundColor="#ffffff")]
	public class Main extends Sprite
	{
		protected var _starling:Starling
		
		public function Main()
		{
			super();
			
			setTimeout(initStarling, 100);
		}
		
		private function initStarling():void {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Starling.multitouchEnabled = true; // useful on mobile devices
			Starling.handleLostContext = true; // deactivate on mobile devices (to save memory)
//			_starling = new Starling(ScrollCar, this.stage)
			_starling = new Starling(ScrollCar, this.stage)
			_starling.simulateMultitouch = true;
			_starling.enableErrorChecking = Capabilities.isDebugger;
			_starling.showStats = true;
			_starling.start();
			
			// this event is dispatched when stage3D is set up
			_starling.stage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE, on3DContextCreated);
			_starling.addEventListener(starling.events.Event.ROOT_CREATED, onStarlingRootCreated);
			_starling.start();
		}
		
		protected function on3DContextCreated(event:flash.events.Event):void
		{
			// set framerate to 30 in software mode
//			logger.info(Starling.context.driverInfo);
			if (Starling.context.driverInfo.toLowerCase().indexOf("software") != -1)
				Starling.current.nativeStage.frameRate = 30;
		}
		
		protected function onStarlingRootCreated(event:starling.events.Event):void {
			//			_starlingRoot = Starling.current.stage.getChildAt(0) as StarlingRootBase;
		}
	}
}