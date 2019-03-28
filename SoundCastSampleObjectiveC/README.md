# SoundCastSampleObjectiveC

## Example

To run the example project, clone the repo, and move to the project root directory SoundCastSampleObjectiveC run `pod install`

## Requirements

## Installation

SoundCastSdk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```Objective-C
pod 'SoundCastIosSdk', '~> 1.5.0.12'
```

Import the library in your **UIView**:

```Objective-C
#import "SoundcastSdk/SoundCastSdk-Swift.h"
```

Implements **SoundCastDelegate** and **SoundCastDataSource**

To use:

```Objective-C
    self.soundCastController = [[SoundCastController alloc] init];
    self.soundCastController.delegate = self;
    self.soundCastController.dataSource = self;
```

### Call to load the ad:

```Objective-C
    [self.soundCastController loadAd:(int)networkID :(int)siteID :(int)tagID :(NSString*)pageTitle :(NSString*)pageDescription :(NSString*)keywords :(NSString*)pageUrl :(NSString*)tags];
```

The **options** HashMap is used to contextualize your article, it contains :
* **SoundcastID (String)** 
* **pageTitle (String):** Title of the page
* **pageDescription (String):** Description of the page
* **keywords (String):** Keywords for the targeting
* **pageUrl (String):** Url of the page
* **tags (String):** Tags for the targeting

Successfull:
Method: (void)didFinishNotAd
Method: (void)didFinishWithAd
Method: (void)didFinishTrackEventWithResponse:
    
Error:
Method: (void)onErrorLoadMediaWithError: error when play ad
Method: (void)onErrorWithError: error load ad
Method: (void)onErrorTrackingWithError: error tracking event

## Author

soundcast

## License

SoundCast is available under the [***soundcast***](https://soundcast.fm) license. See the LICENSE file for more info.


## Any questions

Please contact our support team.