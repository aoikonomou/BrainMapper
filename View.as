package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.external.ExternalInterface;// For talking to the browser, tyring to test right click that doesn't work in Flash when I test my movie
	import flash.text.*;
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import flash.display.Shape;
	import flash.geom.ColorTransform;
	import flash.geom.Point;



	public class View extends MovieClip
	{

		var debugTextField: TextField = new TextField();//To display debug info in

		public function View()
		{



		}


		//------------------------------------------- Custom Functions live below this line ----------------------------------------------


		function createDebugInterface():void
		{

			stage.addChild(debugTextField);
			debugTextField.text = "Debug Text Box";
			debugTextField.border = true;
			debugTextField.width = 350;
			debugTextField.height = 400;
			debugTextField.x = 0;
			debugTextField.y = 0;
			debugTextField.wordWrap = true;
			debugTextField.multiline=true;
			trace("in and working");
			
		}

	}
}
