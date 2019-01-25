//
//  ViewMain.h
//  SoundCastSampleObjectiveC
//
//  Created by Tran Nghia Hiep on 9/18/18.
//  Copyright © 2018 SoundCast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "SoundcastIosSdk/SoundcastIosSdk-Swift.h"
#import "Cells/TableViewCellEvent.h"
#import "../ViewControllers/ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewMain : UIView <SoundCastDelegate, SoundCastDataSource, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *_tfNetworkID;
@property (weak, nonatomic) IBOutlet UITextField *_tfSiteID;
@property (weak, nonatomic) IBOutlet UITextField *_tfTagID;
@property (weak, nonatomic) IBOutlet UIImageView *_imgTestMode;
@property (weak, nonatomic) IBOutlet UIImageView *_imgMidRoll;
@property (weak, nonatomic) IBOutlet UIButton *_btnPlay;
@property (weak, nonatomic) IBOutlet UIButton *_btnStop;
@property (weak, nonatomic) IBOutlet UILabel *_lblCurrentTime;
@property (weak, nonatomic) IBOutlet UILabel *_lblTotalTime;
@property (weak, nonatomic) IBOutlet UISlider *_sliderTime;
@property (weak, nonatomic) IBOutlet UITableView *_tbvEvent;
@property (weak, nonatomic) IBOutlet UIButton *_btnSkip;

@property SoundCastController *soundCastController;
@property ErrorSoundCast *errorSoundCast;
@property AVPlayerItem *avPlayerItem;
@property AVPlayer *avPlayer;
@property NSTimer *timer;
@property bool isTestModeChecked;
@property bool isRollChecked;
@property bool isPlayed;
@property int isMedia; // -1: Nil, 1: isMainMedia, 0: isAdMedia
@property NSMutableArray* datas;
@property NSDictionary* colors;

@property ViewController* rootVC;

@end

NS_ASSUME_NONNULL_END
