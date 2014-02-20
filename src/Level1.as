/**
 * Created by Dragon on 14-2-20.
 */
package {
import citrus.core.IState;
import citrus.core.starling.StarlingState;
import citrus.objects.platformer.box2d.Coin;
import citrus.objects.platformer.box2d.Crate;
import citrus.objects.platformer.box2d.Enemy;
import citrus.objects.platformer.box2d.Hero;
import citrus.objects.platformer.box2d.MovingPlatform;
import citrus.objects.platformer.box2d.Platform;
import citrus.objects.platformer.box2d.Sensor;

import flash.display.DisplayObject;

public class Level1 extends StarlingState implements IState {
    public function Level1(content:DisplayObject)
    {
        super();
        level =lvl;
        var objectsUsed:Array = [Hero, Platform, Sensor, Crate, Enemy, Coin, MovingPlatform];
    }
    override public function intialize();void
    {
        super.initialize();

        var b2d:Box = new BOx2D("box2d");
        b2d.visible = true;
        add(b2d);

        ObjectMaker20.
    }

}
}
