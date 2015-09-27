package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.util.FlxAngle;
import flixel.util.FlxVelocity;

class Player extends FlxSprite
{
	var _up:Bool = false;
	var _down:Bool = false;
 	var _left:Bool = false;
	var _right:Bool = false;
    public function new(x,y)
    {
        super(x,y);
        makeGraphic(20,20,FlxColor.RED);
        acceleration.x = acceleration.y = 0; //sets accelration to 0 
        drag.x = drag.y = 1600;
        maxVelocity.y = 100;
        maxVelocity.x = 100;
    }

    override public function update():Void
    {
        super.update();
        movement();
        angle = FlxAngle.angleBetweenMouse(this, true);
        velocity.x = velocity.y = 0;
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    public function movement():Void
    {
    var speed:Int = 150;
    _up = FlxG.keys.anyPressed(["UP", "W"]);
 	_down = FlxG.keys.anyPressed(["DOWN", "S"]);
 	_left = FlxG.keys.anyPressed(["LEFT", "A"]);
 	_right = FlxG.keys.anyPressed(["RIGHT", "D"]);
    	if(_up)
    	{
    		var angleInRad:Float = (270 * FlxAngle.TO_RAD);
			velocity.x = speed * Math.cos(angleInRad);
			velocity.y = speed * Math.sin(angleInRad);
			acceleration.x = 10;
    	}
    	if(_down)
    	{
    		var angleInRad:Float = (90 * FlxAngle.TO_RAD);
			velocity.x = speed * Math.cos(angleInRad);
			velocity.y = speed * Math.sin(angleInRad);
    	}
    	if(_left)
    	{
    		var angleInRad:Float = (90 * FlxAngle.TO_RAD);
			velocity.x = speed * Math.cos(angleInRad);
			velocity.y = speed * Math.sin(angleInRad);
    	}
    	if(_right)
    	{
    		var angleInRad:Float = (0 * FlxAngle.TO_RAD);
			velocity.x = speed * Math.cos(angleInRad);
			velocity.y = speed * Math.sin(angleInRad);
    	}
    }
}