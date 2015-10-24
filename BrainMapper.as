package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.external.ExternalInterface; // For talking to the browser, tyring to test right click that doesn't work in Flash when I test my movie
	import flash.text.*



	public class BrainMapper extends MovieClip {

		var symbolArray: Array = new Array(); //Holds all display objects (circles) the user creates
		var textFieldArray: Array = new Array(); // Holds all textfields the user creates
		var debugTextField: TextField = new TextField();

		public function BrainMapper() {
			// constructor code

			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, addTextBox);
			stage.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, scrollStage);



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

			objectx.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeSymbol);
			objectx.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, moveObject);
			textFieldArray.push(objectx);
			var currentObject = textFieldArray[textFieldArray.length - 1];
			addChild(currentObject);

			currentObject.x = mouseX - (currentObject.width / 2);
			currentObject.y = mouseY - (currentObject.height / 2);

			trace("Symbol Array size after addition is: ");
			trace(symbolArray.length);

		}



		function removeSymbol(e: MouseEvent) {


			//e.target is the object from which the event originated. The original messager	
			//e.currentTarget is the object that last bubbled up the event

			trace(e.target);

			removeChild(e.target as DisplayObject);

			symbolArray.pop();


		}


		function moveObject(e: MouseEvent) {


			//e.target is the object from which the event originated. The original messager	
			//e.currentTarget is the object that last bubbled up the event

			trace(e.target);
			debugTextField.text = "Middle button pressed";

			var objectx: DisplayObject = e.target as DisplayObject;
			objectx.x = stage.mouseX;
			objectx.y = stage.mouseY;

			debugTextField.appendText("Middle button pressed ");
			debugTextField.appendText(objectx as String);
			debugTextField.appendText(mouseX as String);


		}

		function scrollStage(e: MouseEvent) {

			//ExternalInterface.call("alert", "Hello ExternalInterface");
			symbolArray[1].x = 0;



		}
	}

}