// BrainMapper Software ver 0.1
// Using MVC model. This class (Main) also acts as the controller
// Application implements SRI theory

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
	import Model;
	import View;

	public class BrainMapper extends MovieClip
	{

		var myModel:Model = new Model(); // Create model object
		var myView:View = new View(); //Create view object

		public function BrainMapper()
		{

			addChild(myView);
			myView.stage.addEventListener(MouseEvent.CLICK, addScreenSymbolText);
		}

		//------------------------------------------- Custom Functions live below this line ----------------------------------------------


		
		function addScreenSymbolText(e: MouseEvent)
		{

			//I suppose I need to test what is under the mouse here. If there is anything else other than the stage then do not create a new symbol, otherwise do
			if(findObjectsUnderMouse(e))

			{

				var textContainer = myView.Symbol();

				// Keep track of textFields (text containers in fact, later symbols I suppose in an array for addressing and line linkage purposes?)
				myModel.textFieldArray.push(textContainer);
				var currentObject = myModel.textFieldArray[myModel.textFieldArray.length - 1];


				// Allow textContainer to be deleted and moved as well as connected with a line through mouse clicks.
				textContainer.addEventListener(MouseEvent.MOUSE_DOWN, ruleLineStart);
				textContainer.addEventListener(MouseEvent.MOUSE_UP, ruleLineStop);
				textContainer.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeScreenSymbol);
				textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, dragScreenSymbol);
				textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, releaseScreenSymbol);

				addChild(textContainer);
				
				//Creates the text container where the user clicked on the stage
				textContainer.x = mouseX - (currentObject.width / 2);
				textContainer.y = mouseY - (currentObject.height / 2);
				
			//	myModel.storeSymboltoMemory(textContainer,0,newTextField.text,textContainer.x,textContainer.y,textContainer.width,textContainer.height);
				
			}	
		}



		function removeScreenSymbol(e: MouseEvent)
		{
			//e.target is the object from which the event originated. The original messager
			//e.currentTarget is the object that last bubbled up the event

			findObjectsUnderMouse(e);
			removeChild(e.currentTarget as DisplayObject);
			//debugMessage();
			debugMessage(String(e.target) + " should be deleted");
			
			//symbolArray.pop();
		}


		// Wow, this works in browser but not in Flash Test. I wonder if it works when published.
		function dragScreenSymbol(e: MouseEvent)
		{

			//e.target is the object from which the event originated. The original messager
			//e.currentTarget is the object that last bubbled up the event

			e.target.startDrag();

			debugMessage("Middle button pressed ");

		}

		// Wow, this works in browser but not in Flash Test. I wonder if it works when published.
		function releaseScreenSymbol(e: MouseEvent)
		{

			//e.target is the object from which the event originated. The original messager
			//e.currentTarget is the object that last bubbled up the event

			e.target.stopDrag();

		}


		function panStage(e: MouseEvent)
		{

			//ExternalInterface.call("alert", "Hello ExternalInterface");
			//symbolArray[1].x = 0;

		}

		function connectScreenSymbolsText(x, y)
		{

			var myShape: Shape = new Shape();//Shape class is the least memory intensive one from sprite and MovieClip
			var myShapeContainer: Sprite = new Sprite();//Shape class is the least memory intensive one from sprite and MovieClip

			myShape.graphics.lineStyle(8, 0x7F8080, 1); // x=thickness, y=colour, z= opacity;
			myShape.graphics.moveTo(x[0], x[1]);
			myShape.graphics.lineTo(y[0], y[1]);
			
			myShapeContainer.addChild(myShape);  // If you want to right click on your line it needs to be inside a sprite. Shape won't do it.
			addChild(myShapeContainer);
			debugMessage("Line symbol added");

			myShapeContainer.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeScreenSymbol);

		}


		function ruleLineStart(e: MouseEvent):void
		{

			debugMessage("Line Started");
			
			// Find out which symbol is underneath here
			
			findObjectsUnderMouse(e);
			
			myModel.a[0]=mouseX;
			myModel.a[1]=mouseY;

		}
		
		
		private function findObjectsUnderMouse ($e:MouseEvent):int
		{

			var pt:Point = new Point (mouseX, mouseY);
			var objects:Array = this.getObjectsUnderPoint (pt);

			for (var i:int = 0; i< objects.length; i++)
			{
				trace(">>", objects[i].name,": ",objects[i]);
				trace(">>",  typeof(objects[i]),": ",objects[i]);
			}

			var p:* = $e.target; //$ in front of a variable specifies a static variable. Static variables are usually used to count how many times a class has been instantiated. If you declare a variable, but do not declare its data type, the default data type * will apply, which actually means that the variable is untyped. If you also do not initialize an untyped variable with a value, its default value is undefined .
			while (p)
			{
				trace(">>", p.name,": ",p);
				p = p.parent;
			}

			if (objects.length<2){
				return 1; }

				else {
					return 0;
				}
			}


			function ruleLineStop(e: MouseEvent):void
			{

				var b:Array = new Array();

				b[0]=mouseX;
				b[1]=mouseY;

				connectScreenSymbolsText(myModel.a,b);
				debugMessage("Line Stopped");


			}

			function debugMessage(message):void{

				//myView.updateDebugInterfaceText(message);

			}
			

			
		}
	}
