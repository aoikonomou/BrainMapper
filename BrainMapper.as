package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.external.ExternalInterface; // For talking to the browser, tyring to test right click that doesn't work in Flash when I test my movie
	import flash.text.*;
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import flash.display.Shape;
	import flash.geom.ColorTransform;


	public class BrainMapper extends MovieClip {


		var textFieldArray: Array = new Array(); // Holds all textfields the user creates
		var debugTextField: TextField = new TextField(); //To display debug info in

		// Notes to self. I need to track object position, creation time, current text and history amongst other things.
		var saveList: Array = new Array();

		public function BrainMapper() {
			// constructor code

			//Initialise state saving matrix
			saveList["Number"] = new Array(); // Text box number
			saveList["ObjectRef"] = new Array(); // Object reference in memory
			saveList["X"] = new Array(); // Text box x
			saveList["Y"] = new Array(); // Text box y

			// Initialise other things
			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.CLICK, addTextBox);

			createDebugTextBox(); // To put debug info in

		}


		//////// Custom Functions live below this line /////////////////

		function createDebugTextBox(): void {


			addChild(debugTextField);
			debugTextField.text = "Debug Text Box";
			debugTextField.border = true;
			debugTextField.width = 200;
			debugTextField.height = 200;
			debugTextField.x = 0;
			debugTextField.y = 0;
			debugTextField.wordWrap = true;
		}


		function addTextBox(e: MouseEvent) {

			// Create new textbox object
			var newTextField: TextField = new TextField();
			newTextField.text = "bla";
			newTextField.border = true;
			newTextField.width = 40;
			newTextField.height = 20;
			newTextField.type = TextFieldType.DYNAMIC; //Makes it updatable but you can't type in in. INPUT for that.
			newTextField.autoSize = "left";
			newTextField.multiline = true;

			// Create formatting for the new text box
			var format1: TextFormat = new TextFormat();
			format1.size = 18;
			format1.align = "center";
			format1.leftMargin = 30;
			format1.rightMargin = 30;
			//format1.topMargin = 30; // Don't exist as functions apparently. This one and the one below
			//format1.bottomMargin = 30;

			newTextField.setTextFormat(format1);

			// Create a Sprite container for the textfield above so you can drag it around (not draggable by default, has to be encapsulated in sprite or MovieClip etc.)

			var textContainer: Sprite = new Sprite(); //Only sprites can be dragged and dropped and MovieClipps. Not text fields

			// Changing the colour of the container Sprite
			var textContainerSpriteColorTransform: ColorTransform = new ColorTransform();
			textContainerSpriteColorTransform.color = 0x0000FF;
			textContainer.transform.colorTransform = textContainerSpriteColorTransform;
			//textContainer.width= 30;
			//textContainer.height =20;

			textContainer.graphics.beginFill(0x0000FF, .4); // blue, .4 opacity 
			textContainer.graphics.moveTo(0, 0);
			textContainer.graphics.lineTo(0, 100);
			textContainer.graphics.lineTo(100, 100);
			textContainer.graphics.lineTo(100, 0);
			textContainer.graphics.endFill();




			textContainer.addChild(newTextField);

			textFieldArray.push(textContainer);
			var currentObject = textFieldArray[textFieldArray.length - 1];

			textContainer.addEventListener(MouseEvent.MOUSE_DOWN, lineStart);
			textContainer.addEventListener(MouseEvent.MOUSE_UP, lineStop);
			textContainer.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeSymbol);
			textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, dragObject);
			textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, releaseObject);

			addChild(textContainer);

			textContainer.x = mouseX - (currentObject.width / 2);
			textContainer.y = mouseY - (currentObject.height / 2);

			trace("Symbol Array size after addition is: ");

			connectObjects(textContainer.x, textContainer.y);

		}



		function removeSymbol(e: MouseEvent) {


			//e.target is the object from which the event originated. The original messager	
			//e.currentTarget is the object that last bubbled up the event

			trace(e.target.parent);

			removeChild(e.target.parent as DisplayObject);

			//symbolArray.pop();


		}

		// Wow, this works in browser but not in Flash Test. I wonder if it works when published.
		function dragObject(e: MouseEvent) {

			//e.target is the object from which the event originated. The original messager	
			//e.currentTarget is the object that last bubbled up the event

			e.target.parent.startDrag();

			debugTextField.appendText("Middle button pressed ");

		}

		// Wow, this works in browser but not in Flash Test. I wonder if it works when published.
		function releaseObject(e: MouseEvent) {

			//e.target is the object from which the event originated. The original messager	
			//e.currentTarget is the object that last bubbled up the event

			e.target.parent.stopDrag();

			debugTextField.appendText("Middle button pressed ");

		}


		function scrollStage(e: MouseEvent) {

			//ExternalInterface.call("alert", "Hello ExternalInterface");
			//symbolArray[1].x = 0;


		}

		function connectObjects(x, y) {

			var my_shape: Shape = new Shape(); //Shape class is the least memory intensive one from sprite and MovieClip

			addChild(my_shape);

			my_shape.graphics.lineStyle(1, 0xFF0000, 1);
			my_shape.graphics.moveTo(x, y);
			my_shape.graphics.lineTo(100, 100);


		}


		function lineStart(): void {

			debugTextField.appendText("Line Started ");


		}
		function lineStop(): void {

			debugTextField.appendText("Line Stopped ");


		}


	}

}