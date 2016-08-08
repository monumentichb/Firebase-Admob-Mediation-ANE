package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class ButtonPanel extends Sprite
	{
		private var click:Function;
		public function ButtonPanel(clickHandler:Function)
		{
			super();
			click=clickHandler;
		}
		public function addButton(label:String,x:int,y:int):TextField{
			var check:TextField=new TextField();
			check.defaultTextFormat=new TextFormat(null,26);
			check.text=label;
			check.x=x;
			check.y=y;
			check.width=100;
			check.height=32;
			check.addEventListener(MouseEvent.CLICK,onClick);
			addChild(check);
			return check;
		}
		protected function onClick(event:MouseEvent):void
		{
			if(click!=null){
				var label:TextField=event.currentTarget as  TextField;
				click(label.text);
			}
		}
	}
}