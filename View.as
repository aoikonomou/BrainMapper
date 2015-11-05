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

		var debugTextField: TextField = new TextField(); //To display debug info in

		public function View()
		{



		}


		//------------------------------------------- Custom Functions live below this line ----------------------------------------------


		public function createDebugInterface():void
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


		public function testTextBox():Sprite
		{


// Create Graphics for ScreenSymbolText

				//debugMessage("I am not over an existing text box");

				// Create new textbox object
				var newTextField: TextField = new TextField();
				newTextField.text = "blabla";
				newTextField.border = true;
				newTextField.width = 80;
				newTextField.height = 20;
				newTextField.type = TextFieldType.INPUT;//Makes it updatable but you can't type in in. INPUT for that.
				newTextField.autoSize = "left";
				newTextField.multiline = true;
				newTextField.wordWrap= true;

				// Create formatting for the new text box
				var format1: TextFormat = new TextFormat();
				format1.color = 0xE2E4E5;
				format1.size = 18;
				format1.align = "center";
				//format1.leftMargin = 30;
				//format1.rightMargin = 30;
				//format1.topMargin = 30; // Don't exist as functions apparently. This one and the one below
				//format1.bottomMargin = 30;

				newTextField.setTextFormat(format1); //Set the format to the degug text field you made.

				// Create a Sprite container for the textfield above so you can drag it around (not draggable by default, has to be encapsulated in sprite or MovieClip etc.);

				var textContainer: Sprite = new Sprite(); //Only sprites can be dragged and dropped and MovieClipps. Not text fields
				textContainer.addChild(newTextField);
				
				var textContainerInternalPadding = 30;

				// To size the container sprite we need to put some graphics in it first for some reason.

				textContainer.graphics.beginFill(0x7F8080, 1); // Grey, 1 opacity
				
				textContainer.graphics.drawRoundRect(0, 0, 
					textContainerInternalPadding+newTextField.width,
					textContainerInternalPadding+newTextField.height,
					15,15
				);// (x spacing, y spacing, width, height)
				textContainer.graphics.endFill();

				newTextField.x = textContainerInternalPadding / 2; //Padding value is split in 2 to create equal space left and right of the text box
				newTextField.y = textContainerInternalPadding / 2;

				return textContainer;

		}


	}
}
