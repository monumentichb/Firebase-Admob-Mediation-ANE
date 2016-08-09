Firebase Admob Mediation ANE For Adobe Air
==============================
Google Firebase Admob Mediation Ane provides as3 api for flex and flash developer 
to integrate admob,unityads,inmobi,chartboost,vunlge and gdt into adobe air ios and android app ,support banner Ad,Interstitial Ad,Native Express Ad and Video ,not need java or oc.Support banner,Intersitial,native express ads,Video     

## Quick Start
#### Display firebase  Banner Ads in as3 

    Admob.getInstance().showBanner("your banner id",AdmobSize.BANNER_320x50,AdmobPosition.BOTTOM_CENTER);

The AdmobPosition class specifies where to place the banner. AdmobSize specifies witch size banner to show    

#### Remove Firebase Admob Mediation Banner 

    Admob.getInstance().hideBanner();

#### Show Admob Native Express Ads    
Native express ads is a admob new ad format similar to banner,How to show native express ads in flash air ios and android application?
 it api similar to banner too.        
```
    Admob.getInstance().showNativeBannerAbsolute(nativeID,new AdmobSize(320,132),0,260);
```

nativeID is got from apps.admob.com format like ca-app-pub-3940256099942544/2562852117    
AdSize is the value you set in apps.admob.com    

#### Hide admob native banner
```
    Admob.getInstance().hideNativeBanner();
```
#### Show multi banner or native banner at same screen.
if you want to show multi banner at same screen ,set the name of banner as follow.

    Admob.getInstance().showBanner("your banner id",AdmobSize.BANNER_320x50,AdmobPosition.BOTTOM_CENTER,0,null,"bannerName1");

#### hide named banner

    Admob.getInstance().hideBanner("bannerName1");

#### Admob ANE Show Interstitial 
```
    Admob.getInstance().cacheInterstitial("interstitial id"); 
```
interstitials need to be loaded before shown. show at an appropriate     
stopping point in your app, check that the interstitail is ready before  showing it:
```
    if (Admob.getInstance().isInterstitialReady()) {
      Admob.getInstance().showInterstitial();
    }
```
#### Set Admob Target Param
set Admob target param such as test Ads and children app     
If you want to test the ads or the your app with children target,you can set with admob ANE easy     
```
        extraParam=new ExtraParameter();
	extraParam.testDeviceID="true";
	extraParam.isChildApp=true;
	Admob.getInstance().showBanner("banner ID",AdmobSize.BANNER_320x50,AdmobPosition.BOTTOM_CENTER,80,extraParam);
```
####  Handle admob events
Firebase admob ane supports all admob native event,you can handle as following     
```
        Admob.getInstance().addEventListener(AdmobEvent.onInterstitialReceive, onAdEvent);
	private function onAdEvent(event:AdmobEvent):void
	{
		if (event.type == AdmobEvent.onBannerReceive)
		{
			trace(event.instanceName,event.data.width, event.data.height);
		}
		if (event.type == AdmobEvent.onInterstitialReceive)
		{
			Admob.getInstance().showInterstitial();
		}
	}
```

####  IOS  permission config
NSAppTransportSecurity is required for ios 9,to allow http request,it is required to add NSAppTransportSecurity key
```
			<key>NSAppTransportSecurity</key>
			<dict>
			 <key>NSAllowsArbitraryLoads</key>
			 <true/>
			</dict>
```
#### Android permission config
```
<android>
        <manifestAdditions><![CDATA[
			<manifest android:installLocation="auto">
			    <uses-permission android:name="android.permission.INTERNET"/>
			    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
			    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
			     <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
			     <application>
  <meta-data android:name="com.google.android.gms.version"
        android:value="@integer/google_play_services_version" />
        <activity android:name="com.google.android.gms.common.api.GoogleApiActivity"
                  android:theme="@android:style/Theme.Translucent.NoTitleBar"
                  android:exported="false"/>
			  	        <activity
            android:name="com.google.android.gms.ads.AdActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" android:theme="@android:style/Theme.Translucent"/>
            
            <activity android:name="com.chartboost.sdk.CBImpressionActivity"
            	   android:excludeFromRecents="true"
                   android:hardwareAccelerated="true"
            	   android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen"
                   android:configChanges="keyboardHidden|orientation|screenSize"/>
                
                <service android:name="com.qq.e.comm.DownloadService" android:exported="false" />
				<activity android:name="com.qq.e.ads.ADActivity" android:configChanges="keyboard|keyboardHidden|orientation|screenSize" />

                <activity
            android:name="com.unity3d.ads.android.view.UnityAdsFullscreenActivity"
            android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
            android:hardwareAccelerated="true"
            />
            
             <activity
            android:name="com.inmobi.rendering.InMobiAdActivity"
            android:configChanges="keyboardHidden|orientation|keyboard|smallestScreenSize|screenSize"
            android:hardwareAccelerated="true"
            android:theme="@android:style/Theme.Translucent.NoTitleBar"
            tools:ignore="UnusedAttribute" />
            <receiver
            android:name="com.inmobi.commons.core.utilities.uid.ImIdShareBroadCastReceiver"
            android:enabled="true"
            android:exported="true"
            tools:ignore="ExportedReceiver">
            <intent-filter>
                <action android:name="com.inmobi.share.id" />
            </intent-filter>
        </receiver>
        <service
            android:name="com.inmobi.signals.activityrecognition.ActivityRecognitionManager"
            android:enabled="true" />
            
             <activity
 android:name="com.vungle.publisher.FullScreenAdActivity"
 android:configChanges="keyboardHidden|orientation|screenSize"
 android:theme="@android:style/Theme.NoTitleBar.Fullscreen"/>
			     </application>
			</manifest>
		]]></manifestAdditions>
    </android>
```

####  ANE ID
        <extensionID>com.google.firebase.admob</extensionID>

Firebase admob mediation ane project home
https://github.com/monumentichb/Firebase-Admob-Mediation-ANE