package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.external.ExternalInterface; // For talking to the browser, tyring to test right click that doesn't work in Flash when I test my movie
	import flash.text.*



	public class BrainMapper extends MovieClip {

		var symbolArray: Array = new Array(); //Holds all display objects the user creates
		var debugTextField: TextField = new TextField();

		public function BrainMapper() {
			// constructor code

			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, addSymbol);
			stage.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, scrollStage);
			//stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeSymbol);


			// Debug Textbox

			addChild(debugTextField);
			debugTextField.text = "andreas";
			debugTextField.border = true;


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




		function removeSymbol(e: MouseEvent) {


			//e.target is the object from which the event originated. The original messager	
			//e.currentTarget is the object that last bubbled up the event

			trace(e.target);

			removeChild(e.target as DisplayObject);

			symbolArray.pop();


		}


		function scrollStage(e: MouseEvent) {

			//ExternalInterface.call("alert", "Hello ExternalInterface");
			symbolArray[1].x = 0;



		}
	}

}