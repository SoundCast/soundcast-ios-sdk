# SoundcastSampleSwift

## Example

To run the example project, clone the repo, and move to the project root directory SoundcastSampleSwift run `pod install`

## Requirements

## Installation

SoundCastSdk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SoundCastIosSdk', '~> 1.5.0.8'
```

Import the library in your **UIView**:

```ruby
import SoundCastSdk
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
    soundcastController.loadAd(request: ResponseModel(networkID,siteID,tagID,pageTitle,pageDescription,keywords,pageUrl,tags))
```

The **options** HashMap is used to contextualize your article, it contains :
* **SoundcastID (String)** 
* **pageTitle (String):** Title of the page
* **pageDescription (String):** Description of the page
* **keywords (String):** Keywords for the targeting
* **pageUrl (String):** Url of the page
* **tags (String):** Tags for the targeting
    
Method *func didFinishNotAd():* used non-advertising returns.

Method *func didFinishWithAd():* used advertising.

Method *func didFinishTrackEvent():* track event successfull
    
Method *func onError(error: String)*: returns an error loading the creative

Method *func onErrorLoadMedia(error: String):* error when play advertising

Method *func onErrorTracking(error: String):* error when tracking event


## Author

soundcast

## License

Soundcast is available under the [***soundcast***](https://soundcast.fm) license. See the LICENSE file for more info.

## Any questions

Please contact our support team.