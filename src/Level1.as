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
import citrus.physics.box2d.Box2D;
import citrus.utils.objectmakers.ObjectMaker2D;

import flash.display.MovieClip;

public class Level1 extends StarlingState implements IState {
    private var level:MovieClip;
    private var hero:Hero;
    public function Level1(lvl:MovieClip)
    {
        super();
        level =lvl;
        var objectsUsed:Array = [Hero, Platform, Sensor, Crate, Enemy, Coin, MovingPlatform];
    }
    override public function initialize():void
    {
        super.initialize();

        var b2d:Box2D = new Box2D("box2d");
        b2d.visible = false;
        add(b2d);
        ObjectMaker2D.FromMovieClip(level);

        hero = new Hero("hero", {x:142, y:304, width:66, height:92, view:"../sprites/front.png"});
        add(hero);
    }

}
}