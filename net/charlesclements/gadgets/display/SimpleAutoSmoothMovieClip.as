import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.geom.ColorTransform;
import flash.geom.Rectangle;


class net.charlesclements.gadgets.display.SimpleAutoSmoothMovieClip extends MovieClip
{

	public function SimpleAutoSmoothMovieClip()
	{

		super();
		takeSnapshot();
		
	}
	
	
	/* 
	Takes a picture of the phone to use bitmap smoothing.
	*/
	private function takeSnapshot():Void
	{
		
		var b:BitmapData = new BitmapData( _width+150, _height+150, true, 0xff0000 );//
		b.draw( this, new Matrix(), new ColorTransform(), "normal", new Rectangle( 0, 0, b.width, b.height ), true );//
		var mc:MovieClip;
		for(var i in this ){
			
	        if( typeof(this[ i ]) == "movieclip" )
	        {

				mc = this[ i ];
				mc.swapDepths( 0 );
				mc.removeMovieClip();

	        }
	    }
		attachBitmap( b, 0, "auto", true);
		
	}
	
}