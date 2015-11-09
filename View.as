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

		public function View()
		{

			trace(stage);
			//Initialise view interface
			//stage.doubleClickEnabled = true;  //Doesn't currently work. Do i need to enable it for main stage?
			var myDebugInterface = createDebugInterface();// To put debug info in
			addChild(myDebugInterface);

		}


		//------------------------------------------- Custom Functions live below this line ----------------------------------------------


		public function createDebugInterface():TextField
		{

			var debugTextField: TextField = new TextField(); //To display debug info in

			
			debugTextField.text = "Debug Text Box";
			debugTextField.border = true;
			debugTextField.width = 350;
			debugTextField.height = 400;
			debugTextField.x = 0;
			debugTextField.y = 0;
			debugTextField.wordWrap = true;
			debugTextField.multiline=true;

			//addChild(debugTextField);

			trace("In createDebugInterface function. Working properly");

			return debugTextField;
			
		}


		public function updateDebugInterfaceText(message):void{



		//	stage.debugTextField.appendText(message);
			



		}



		public function createCreationInterface():void{


			var creationInterface: Sprite = new Sprite(); //Only sprites can be dragged and dropped and MovieClipps. Not text fields
			//textContainer.addChild(creationInterface);
			
			var creationInterfaceInternalPadding = 30;

			// To size the container sprite we need to put some graphics in it first for some reason. We 'll put three boxes of different colour.


			var option1Box: Sprite = new Sprite();
			var option2Box: Sprite = new Sprite();
			var option3Box: Sprite = new Sprite();


			//Interface box 


			//createGraphicsShape(graphicType, xLoc, yLoc,opacity, shapeWidth, shapeHeight, padding);


			addChild(option1Box);
			

		}


		public function Symbol():Sprite
		{


			// Create Graphics for ScreenSymbolText

			//debugMessage("I am not over an existing text box");

			// Create new textField object to write text in
			var newTextField: TextField = new TextField();
			newTextField.text = "blabla";
			newTextField.border = true;
			newTextField.width = 80;
			newTextField.height = 20;
			newTextField.type = TextFieldType.INPUT;//Makes it updatable but you can't type in in. INPUT for that.
			newTextField.autoSize = "left";
			newTextField.multiline = true;
			newTextField.wordWrap= true;

			// Create formatting for the new textField
			var format1: TextFormat = new TextFormat();
			format1.color = 0xE2E4E5;
			format1.size = 18;
			format1.align = "center";
			//format1.leftMargin = 30;
			//format1.rightMargin = 30;
			//format1.topMargin = 30; // Don't exist as functions apparently. This one and the one below
			//format1.bottomMargin = 30;

			newTextField.setTextFormat(format1); //Set the format to the degug text field you made.

			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// Create a Sprite container for the textfield above so you can drag it around (not draggable by default, has to be encapsulated in sprite or MovieClip etc.);

			var textContainer: Sprite = new Sprite(); //Only sprites can be dragged and dropped and MovieClipps. Not text fields
			textContainer.addChild(newTextField);
			
			var textContainerInternalPadding = 30;

			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// To size the container sprite we need to put some graphics in it first for some reason.

			//createGraphicsShape(graphicType, xLoc, yLoc,opacity, shapeWidth, shapeHeight, padding); // (graphicType, xLoc, yLoc,opacity, shapeWidth, shapeHeight, padding


			return textContainer;

		}


		

/*
		function createGraphicsShape(graphicType, xLoc, yLoc,opacity, shapeWidth, shapeHeight, padding):void{

			
			switch (myVariable){

			case 1:
			trace("case1");


			object.graphics.beginFill(0x7F8080, 1); // Grey, 1 opacity
			
			object.graphics.drawRoundRect(0, 0, 
				padding+object.width,
				padding+object.height,
				shapeWidth,shapeHeight
			);// (x spacing, y spacing, width, height)
			object.graphics.endFill();

			return

			return;
			break;

			case 2:
			trace("case2");
			return;
			break;

			case 3:
			trace("case3");
			return;
			break;

			}



		

		}
*/
		
	}
}
