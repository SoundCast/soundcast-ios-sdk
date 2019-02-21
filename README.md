# SoundcastSampleSwift

## Example

To run the example project, clone the repo, and move to the project root directory SoundcastSampleSwift run `pod install`

## Download our sample apps
Download our sample app from our github repository
```
git clone https://github.com/SoundCast/soundcast-ios-sdk.git
```
## Swift
Click [here](SoundCastSampleSwift) for the **Swift** documentation

```
cd SoundCastSampleSwift
```

## Objective-C
Click [here](SoundCastSampleObjectiveC) for the **Objective-C** documentation
```
cd SoundCastSampleObjectiveC
```

## Installation

SoundcastSdk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SoundCastIosSdk'
```

Import the library in your **UIView**:

```ruby
import SoundCastIosSdk
```

Implements **SoundcastDelegate** and **SoundcastDataSource**

To use:

```ruby
    soundcastController = SoundcastController()
    soundcastController?.delegate = self
    soundcastController?.dataSource = self
```

### Call to load the ad:

```ruby
    soundcastController.getXML(request: ResponseModel(networkID,siteID,tagID,pageTitle,pageDescription,keywords,pageUrl,tags))
```

The **options** HashMap is used to contextualize your article, it contains :
* **SoundcastID (String)**  
* **pageTitle (String):** Title of the page
* **pageDescription (String):** Description of the page
* **keywords (String):** Keywords for the targeting
* **pageUrl (String):** Url of the page
* **tags (String):** Tags for the targeting
    
Method *func onSuccess(response: ResponseModel):* used non-advertising returns.

Method *func onSuccessParserXML(response: ObjectAds):* returns the object include:
* **rid (String):** **VAST** or **DAAST** id
* **duration (Int):** Ad delivery time
* **mediaFiles (Array<MediaFile>):** Array media file ad
* **companionAds Array<CompanionAd>:** 
* **impressionTrack (String):** URL for track impression event
* **clickTrack (String):** URL for track click event
* **clickThrough (String):** URL for track through event
    
Method *func onError(error: String)*: returns an error loading the creative


## Any questions

Please contact our support team.