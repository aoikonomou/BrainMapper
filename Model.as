package 
{

	import flash.display.MovieClip;

	public class Model extends MovieClip
	{

		var saveList: Array = new Array();

		public function Model()
		{

			// Notes to self. I need to track object position, creation time, current text and history amongst other things.
		
			trace("I am in model now");

		}


		public function storeSymboltoMemory(object, time, text, x, y, width, height):void{

		//Store Object data for saving and future use
			var objectData:Array = new Array();
				
			objectData.push(object);
			objectData.push(time);
			objectData.push(text);
			objectData.push(x);
			objectData.push(y);
			objectData.push(width);
			objectData.push(height);

			saveList.push(objectData);
			trace(saveList[saveList.length-1][2]);
				
/*			
			debugMessage("saveList Array size after addition is: ");
			debugMessage(saveList.length);
			
			*/

			for each (var item in objectData){

				for each (var innerItem in objectData[item]){
				
				// debugMessage(objectData[item][innerItem]);
				// debugMessage("I am now displaying from Model class");

				}
			}
		}
	}
}