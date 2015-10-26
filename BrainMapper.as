package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.external.ExternalInterface; // For talking to the browser, tyring to test right click that doesn't work in Flash when I test my movie
	import flash.text.*;
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import flash.display.Shape;


	public class BrainMapper extends MovieClip {

		var symbolArray: Array = new Array(); //Holds all display objects (circles) the user creates
		var textFieldArray: Array = new Array(); // Holds all textfields the user creates
		var debugTextField: TextField = new TextField();

		// Notes to self. I need to track object position, creation time, current text and history amongst other things.



		public function BrainMapper() {
			// constructor code

			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.DOUBLE_CLICK, addTextBox);
			//stage.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, moveObject);


			// Debug Textbox

			addChild(debugTextField);
			debugTextField.text = "andreas";
			debugTextField.border = true;
			debugTextField.width = 200;
			debugTextField.height = 200;
			debugTextField.wordWrap = true;


		}


		//////// Functions live below this line //////////////////


		function addSymbol(e: MouseEvent) {

			var objectx: Symbol1 = new Symbol1();
			objectx.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeSymbol);
			symbolArray.push(objectx);
			var currentObject = symbolArray[symbolArray.length - 1];
			addChild(currentObject);

			currentObject.x = mouseX - (currentObject.width / 2);
			currentObject.y = mouseY - (currentObject.height / 2);

			trace("Symbol Array size after addition is: ");
			trace(symbolArray.length);

		}

		function addTextBox(e: MouseEvent) {

			var objectx: TextField = new TextField();
			objectx.text = "bla";
			objectx.border = true;
			objectx.width = 40;
			objectx.height = 20;
			objectx.type = TextFieldType.INPUT;
			objectx.autoSize = "left";
			objectx.multiline = true;

			var format1: TextFormat = new TextFormat();
			format1.size = 18;
			format1.align = "center";
			format1.leftMargin = 30;
			format1.rightMargin = 30;
			//format1.topMargin = 30; // Don't exist as functions apparently. This one and the one below
			//format1.bottomMargin = 30;


			objectx.setTextFormat(format1);


			var textContainer: Sprite = new Sprite(); //Only sprites can be dragged and dropped and MovieClipps. Not text fields
			textContainer.addChild(objectx);


			textFieldArray.push(textContainer);
			var currentObject = textFieldArray[textFieldArray.length - 1];

			textContainer.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeSymbol);
			textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, dragObject);
			textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, releaseObject);



			addChild(textContainer);

			textContainer.x = mouseX - (currentObject.width / 2);
			textContainer.y = mouseY - (currentObject.height / 2);

			trace("Symbol Array size after addition is: ");
			trace(symbolArray.length);

			connectObjects();

		}



		function removeSymbol(e: MouseEvent) {


			//e.target is the object from which the event originated. The original messager	
			//e.currentTarget is the object that last bubbled up the event

			trace(e.target.parent);

			removeChild(e.target.parent as DisplayObject);

			symbolArray.pop();


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
			symbolArray[1].x = 0;


		}

		function connectObjects() {

			var my_shape: Shape = new Shape(); //Shape class is the least memory intensive one from sprite and MovieClip

			addChild(my_shape);

			my_shape.graphics.lineStyle(1, 0xFF0000, 1);
			my_shape.graphics.moveTo(10, 100);
			my_shape.graphics.lineTo(100, 100);


		}






	}

}