package
{
	import com.google.firebase.admob.*;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	public class demo extends Sprite
	{
		private var admob:Admob;
		public var bannerID:String="ca-app-pub-3940256099942544/2934735716";
		public var interstitialID:String="ca-app-pub-3940256099942544/4411468910";
		public var nativeID:String="ca-app-pub-3940256099942544/2562852117";
		public var videoID:String="admob video id";

		public function demo()
		{
			super();
			initUI();
			admob=Admob.getInstance();
			if (admob.supportDevice)
			{
				admob.addEventListener(AdmobEvent.onInterstitialReceive, onAdEvent);
				admob.addEventListener(AdmobEvent.onBannerReceive, onAdEvent);
				admob.enableTrace=true;
			}

			showStartAd();
		}

		private function showStartAd():void
		{
			admob.showNativeBannerAbsolute(nativeID, new AdmobSize(320, 132), 0, 260);
			admob.cacheInterstitial(interstitialID);
			admob.showBanner(bannerID, AdmobSize.BANNER_320x50, AdmobPosition.BOTTOM_CENTER);
			admob.showBanner(bannerID, AdmobSize.BANNER_320x50, AdmobPosition.TOP_CENTER, 0, null, "classicBanner");
		}

		private function initUI():void
		{
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			var ui:ButtonPanel=new ButtonPanel(onClick);
			addChild(ui);
			ui.addButton("relation", 20, 40);
			ui.addButton("absolute", 200, 40);
			ui.addButton("hide", 20, 120);
			ui.addButton("interstitial", 200, 120);
			ui.addButton("native", 200, 320);
			ui.addButton("hidenative", 300, 90);

			ui.addButton("video", 20, 420);
		}

		private function onAdEvent(event:AdmobEvent):void
		{
			if (event.type == AdmobEvent.onBannerReceive)
			{
				trace(event.instanceName, event.data.width, event.data.height);
			}
			if (event.type == AdmobEvent.onInterstitialReceive)
			{
				admob.showInterstitial();
			}
		}

		private function onClick(label:String):void
		{

			trace("click button " + label);
			if (!admob.supportDevice)
			{
				trace("not support device");
				return
			}
			else
			{
				if (label == "hide")
				{
					admob.hideBanner();
					admob.hideBanner("classicBanner");
				}
				if (label == "absolute")
				{
					admob.showBannerAbsolute(bannerID, AdmobSize.BANNER_320x50, 0, 120);
				}
				else if (label == "relation")
				{
					admob.showBanner(bannerID, AdmobSize.BANNER_STANDARD, AdmobPosition.BOTTOM_CENTER, 0);
				}
				else if (label == "interstitial")
				{
					if (admob.isInterstitialReady())
					{
						admob.showInterstitial();
					}
					else
					{
						admob.cacheInterstitial(interstitialID);
					}
				}
				else if (label == "native")
				{
					admob.showNativeBannerAbsolute(nativeID, new AdmobSize(320, 132), 0, 260);
				}
				else if (label == "hidenative")
				{
					admob.hideNativeBanner();
				}
				else if (label == "video")
				{
					if (admob.isVideoReady())
					{
						admob.showVideo();
					}
					else
					{
						admob.cacheVideo(videoID);
					}
				}
			}
		}
	}
}
