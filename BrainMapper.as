package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;


	public class BrainMapper extends MovieClip {
		
		var symbolArray:Array = new Array();


		public function BrainMapper() {
			// constructor code

			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.DOUBLE_CLICK, addSymbol);
		

		}
		
		
		//////// Functions live below this line //////////////////


		function addSymbol(e:MouseEvent) {
			
			var objectx:Symbol1 = new Symbol1();
			
			symbolArray.push(objectx);
			//var textbox1: textBoxSymbol = new textBoxSymbol();
			var currentObject = symbolArray[symbolArray.length-1];
			addChild(currentObject);

			//addChild(textbox1);
			//sprite1.startDrag(true);
			//textbox1.x = mouseX - (sprite1.width / 2); //symbolx;
			//textbox1.y = mouseY - (sprite1.height / 2); //symboly;
			
			currentObject.x = mouseX - (currentObject.width / 2);
			currentObject.y = mouseY - (currentObject.height / 2);
			
			trace("Symbol Array size after addition is: ");
			trace(symbolArray.length);

		}




		function removeSymbol(e: MouseEvent) {

			
			var thisObject:DisplayObject = e.currentTarget as DisplayObject;
			trace(thisObject);
			
			thisObject.x = mouseX - (thisObject.width / 2);
			thisObject.x = mouseY - (thisObject.height / 2);

	trace("Symbol Array size after removal is: ");
			trace(symbolArray.length);
			

		}


	}

}