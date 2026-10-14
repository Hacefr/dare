package funkin.graphics.video;

#if hxvlc
import funkin.play.PlayState;
import hxvlc.flixel.FlxVideoSprite;

/**
 * Not to be confused with FlxVideo, this is a hxvlc based video class.
 */
@:nullSafety
class FunkinVideoSprite extends FlxVideoSprite
{
  public function new(x:Float = 0, y:Float = 0)
  {
    super(x, y);

    if (bitmap != null)
    {
      bitmap.onOpening.add(function():Void
      {
        if (bitmap != null)
        {
          if (PlayState.instance != null)
          {
            bitmap.rate = PlayState.instance.playbackRate;
          }
        }
      });
    }
  }
}
#else
import flixel.FlxSprite;

/**
 * Web fallback for FunkinVideoSprite when hxvlc is disabled.
 */
class FunkinVideoSprite extends FlxSprite
{
  public var bitmap:Dynamic = null;

  public function new(x:Float = 0, y:Float = 0)
  {
    super(x, y);
  }

  public function play():Void {}
  public function pause():Void {}
  public function resume():Void {}
  public function stop():Void {}
  public function load(path:String):Void {}
}
#end
