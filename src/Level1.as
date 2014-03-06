/**
 * Created by Dragon on 14-2-20.
 */
package {
import Box2D.Dynamics.Contacts.b2PolygonContact;

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
import citrus.physics.box2d.Box2DUtils;
import citrus.utils.objectmakers.ObjectMaker2D;
import citrus.view.starlingview.StarlingCamera;

import flash.display.MovieClip;
import flash.geom.Point;
import flash.geom.Rectangle;

public class Level1 extends StarlingState implements IState {
    private var level:MovieClip;
    private var hero:Hero;
    private var fall:Sensor;
    private var reset:Boolean;
    private var cam:StarlingCamera;
    private var spikes:Sensor;
    private var spikes2:Sensor;
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

        hero = new Hero("hero", {x:142, y:304, width:66, height:92, view:"../sprites/hero_walk.swf"});
        add(hero);

        fall = getObjectByName("fall") as Sensor;
        fall.onBeginContact.add(onFall);
        spikes = getObjectByName("spikes") as Sensor;
        spikes.onBeginContact.add(onDie);
        spikes2 = getObjectByName("spike2") as Sensor;
        spikes2.onBeginContact.add(onDie);

        cam = view.camera as StarlingCamera;
        cam.setUp(hero, new Rectangle(0, 0, 2000, 768), new Point(.5,.5), new Point(.25,.05));
    }

    override public function update(timeDelta:Number):void
    {
        super.update(timeDelta);
        if(reset)
        {
            resetHero(150,100);
        }
    }

    private function resetHero(x:int, y:int):void {
        hero.x = x;
        hero.y = y;
        reset = false;
    }
        private function onFall(c:b2PolygonContact):void {
            if(Box2DUtils.CollisionGetOther(fall, c)is Hero){
                trace("hero fall");
                reset = true;
            }
        }
    private function onDie(c:b2PolygonContact):void {
        if(Box2DUtils.CollisionGetOther(spikes, c)is Hero){
            trace("hero died");
            reset = true;
        }
    }

}
}