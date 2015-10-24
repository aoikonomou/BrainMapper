package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;


	public class BrainMapper extends MovieClip {


		public function BrainMapper() {
			// constructor code


			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.DOUBLE_CLICK, addSymbol);
		





		}
		//////// Functions live below this line


		function addSymbol(e:MouseEvent) {
			var sprite1: Symbol1 = new Symbol1();
			//var textbox1: textBoxSymbol = new textBoxSymbol();
			addChild(sprite1);

			//addChild(textbox1);
			//sprite1.startDrag(true);
			//textbox1.x = mouseX - (sprite1.width / 2); //symbolx;
			//textbox1.y = mouseY - (sprite1.height / 2); //symboly;
			
			sprite1.x = mouseX - (sprite1.width / 2);
			sprite1.y = mouseY - (sprite1.height / 2);

		}







		function removeSymbol(e: MouseEvent) {
			//var sprite1: Symbol1 = new Symbol1();
			//var textbox1: textBoxSymbol = new textBoxSymbol();
			//addChild(sprite1);
			//removeChild(this);
			//sprite1.startDrag(true);
			//textbox1.x = mouseX-(sprite1.width/2); //symbolx;
			//textbox1.y = mouseY-(sprite1.height/2); //symboly;

			
				var thisObject:DisplayObject = e.currentTarget as DisplayObject;
			trace(thisObject);
			
			thisObject.x = mouseX - (thisObject.width / 2);
			thisObject.x = mouseY - (thisObject.height / 2);



		}


	}

}