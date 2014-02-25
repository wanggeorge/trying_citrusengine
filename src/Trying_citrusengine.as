package {
import citrus.core.starling.StarlingCitrusEngine;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

[SWF(width="1024",height="768", frameRate="60", backgroundColor="0x33ccff")]
public class Trying_citrusengine extends StarlingCitrusEngine {
    private var loader:Loader;
    public function Trying_citrusengine()
    {
       setUpStarling(true);
       loader = new Loader();
       loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoad);
       loader.load(new URLRequest("../levels/level1.swf"));
    }

    private function onLoad(event:Event):void {
       state = new Level1(event.target.loader.content);

       loader.removeEventListener(Event.COMPLETE,onLoad);
       loader.unloadAndStop(true);

    }
}
}
