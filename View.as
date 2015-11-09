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



		public function creationInterface():void{


			var myCreationInterface: Sprite = new Sprite(); //Only sprites can be dragged and dropped and MovieClipps. Not text fields
			//textContainer.addChild(creationInterface);
			
			var myCreationInterfaceInternalPadding = 30;

			// To size the container sprite we need to put some graphics in it first for some reason. We 'll put three boxes of different colour.


			var option1Box: Sprite = new Sprite();
			var option2Box: Sprite = new Sprite();
			var option3Box: Sprite = new Sprite();

			createGraphicsShape(1, option1Box, 0,0, 1, "red", option1Box.width+30, option1Box.width+30, myCreationInterfaceInternalPadding); // (graphicType, object, xLoc, yLoc, opacity, colour, shapeWidth, shapeHeight, padding
			createGraphicsShape(1, option2Box, 0,50, 1, "blue", option2Box.width+30, option2Box.width+30, myCreationInterfaceInternalPadding); // (graphicType, object, xLoc, yLoc,opacity, colour, shapeWidth, shapeHeight, padding
			createGraphicsShape(1, option3Box, 0,100, 1, "green", option3Box.width+30, option3Box.width+30, myCreationInterfaceInternalPadding); // (graphicType, object, xLoc, yLoc,opacity, colour, shapeWidth, shapeHeight, padding



			//Interface box 

			
			addChild(option1Box);
			addChild(option2Box);
			addChild(option3Box);

			

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

			createGraphicsShape(1, textContainer, 0,0, 1, "purple", textContainer.width+30, textContainer.width+30, textContainerInternalPadding); // (graphicType, object, xLoc, yLoc,opacity, shapeWidth, shapeHeight, padding


			return textContainer;

		}


		


		function createGraphicsShape(graphicType, object, xLoc, yLoc,opacity, colour, shapeWidth, shapeHeight, padding):void{

			
			switch (graphicType){

			case 1:
			trace("case1");


			object.graphics.beginFill(colours(colour), 1); // Grey, 1 opacity
			
			object.graphics.drawRoundRect(xLoc, yLoc, 
				padding+object.width,
				padding+object.height,
				shapeWidth,shapeHeight
			);// (x spacing, y spacing, width, height)
			object.graphics.endFill();


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
		
		
		function colours(colour):int{
			
			var red = "#FF3005";
			var yellow = "#FFF90A";
			var green = "#51FF02";
			var lightBlue = "#0CFAFF";
			var blue = "#004EFA";
			var purple = "#E200F3";
			var lightGrey = "#BDBDBD";
			var grey = "#494949";
			
			switch (colour) {
				
				case "red":
					return parseInt(red);
					break;
				case yellow:
					return yellow;
				break;
				case green:
					return green;
					break;
				case lightBlue:
					return lightBlue;
				break;
				case blue:
					return blue;
				break;
				case purple:
					return purple;
				break;
				case lightGrey:
					return lightGrey;
				break;
				case grey:
					return grey;
				break;
				
				}
			
				return 0; //If the above didn't work
				
			}
		
	}
}
