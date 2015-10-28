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


	public class BrainMapper extends MovieClip
	{

		var textFieldArray: Array = new Array();// Holds all textfields the user creates
		var debugTextField: TextField = new TextField();//To display debug info in

		// Notes to self. I need to track object position, creation time, current text and history amongst other things.
		var saveList: Array = new Array();
		
		var a:Array = new Array(); // Point A x/y coordinates of connecting line
		var b:Array = new Array(); // Point B of connecting line

		public function BrainMapper()
		{

			// Initialise other things
			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.CLICK, addTextBox);

			createDebugTextBox();// To put debug info in

		}


		//------------------------------------------- Custom Functions live below this line ----------------------------------------------

		function createDebugTextBox():void
		{

			addChild(debugTextField);
			debugTextField.text = "Debug Text Box";
			debugTextField.border = true;
			debugTextField.width = 200;
			debugTextField.height = 200;
			debugTextField.x = 0;
			debugTextField.y = 0;
			debugTextField.wordWrap = true;
		}


		function addTextBox(e: MouseEvent)
		{

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

			newTextField.setTextFormat(format1);

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

			// Keep track of textFields (text containers in fact, later symbols I suppose in an array for addressing and line linkage purposes?)
			textFieldArray.push(textContainer);
			var currentObject = textFieldArray[textFieldArray.length - 1];


			// Allow textContainer to be deleted and moved as well as connected with a line through mouse clicks.
			textContainer.addEventListener(MouseEvent.MOUSE_DOWN, lineStart);
			textContainer.addEventListener(MouseEvent.MOUSE_UP, lineStop);
			textContainer.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeSymbol);
			textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, dragObject);
			textContainer.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, releaseObject);

			addChild(textContainer);
			
			//Creates the text container where the user clicked on the stage
			textContainer.x = mouseX - (currentObject.width / 2);
			textContainer.y = mouseY - (currentObject.height / 2);

			connectObjects(textContainer.x, textContainer.y); // What does that do?
			
			//Store Object data for saving and future use
			var objectData:Array = new Array();
			
			objectData.push(textContainer);
			objectData.push(newTextField.text);
			objectData.push(textContainer.x);
			objectData.push(textContainer.y);
			
			saveList.push(objectData);
			trace(saveList[saveList.length-1][2]);
			
			trace("saveList Array size after addition is: ");
			trace(saveList.length);

		}



		function removeSymbol(e: MouseEvent)
		{
			//e.target is the object from which the event originated. The original messager
			//e.currentTarget is the object that last bubbled up the event

			removeChild(e.target as DisplayObject);
			debugTextField.appendText("I should be deleted");
			
			//symbolArray.pop();
		}

		


		// Wow, this works in browser but not in Flash Test. I wonder if it works when published.
		function dragObject(e: MouseEvent)
		{

			//e.target is the object from which the event originated. The original messager
			//e.currentTarget is the object that last bubbled up the event

			e.target.startDrag();

			debugTextField.appendText("Middle button pressed ");

		}

		// Wow, this works in browser but not in Flash Test. I wonder if it works when published.
		function releaseObject(e: MouseEvent)
		{

			//e.target is the object from which the event originated. The original messager
			//e.currentTarget is the object that last bubbled up the event

			e.target.stopDrag();

			debugTextField.appendText("Middle button pressed ");

		}


		function scrollStage(e: MouseEvent)
		{

			//ExternalInterface.call("alert", "Hello ExternalInterface");
			//symbolArray[1].x = 0;


		}

		function connectObjects(x, y)
		{

			var my_shape: Shape = new Shape();//Shape class is the least memory intensive one from sprite and MovieClip


			my_shape.graphics.lineStyle(4, 0x7F8080, 1);
			// x=thickness, y=colour, z= opacity;
			my_shape.graphics.moveTo(x[0], x[1]);
			my_shape.graphics.lineTo(y[0], y[1]);
			
			addChild(my_shape);

			my_shape.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, removeSymbol);

		}


		function lineStart(e: MouseEvent):void
		{

			debugTextField.appendText("Line Started ");

			
			// Find out which symbol is underneath here
			
			checkMouseEventTrail(e);
			
			
			
			a[0]=mouseX;
			a[1]=mouseY;


		}
		
		
		
		
		private function checkMouseEventTrail ($e:MouseEvent):void
		{

			var pt:Point = new Point (mouseX, mouseY);
			var objects:Array = this.getObjectsUnderPoint (pt); 
			for (var i:int = 0; i< objects.length; i++)
			{
				trace(">>", objects[i].name,": ",objects[i]);
			}

			var p:* = $e.target; //$ in front of a variable specifies a static variable. Static variables are usually used to count how many times a class has been instantiated. If you declare a variable, but do not declare its data type, the default data type * will apply, which actually means that the variable is untyped. If you also do not initialize an untyped variable with a value, its default value is undefined .
			while (p)
			{
				trace(">>", p.name,": ",p);
				p = p.parent;
			}


		}




		function lineStop(e: MouseEvent):void
		{

			var b:Array = new Array();

			b[0]=mouseX;
			b[1]=mouseY;

			connectObjects(a,b);
			debugTextField.appendText("Line Stopped ");


		}
	}
}
