//
//  ViewMain.m
//  SoundCastSampleObjectiveC
//
//  Created by Tran Nghia Hiep on 9/18/18.
//  Copyright © 2018 SoundCast. All rights reserved.
//

#import "ViewMain.h"


NSString *const CallAd = @"call ad";
NSString *const StartAd = @"ad start";
NSString *const ErrorAd = @"Error: No ad";
NSString *const FirstQuartile = @"ad first quartile";
NSString *const MidPoint = @"ad midpoint";
NSString *const ThirdQuartile = @"ad third quartile";
NSString *const Complete = @"ad complete";
NSString *const PlayContent = @"audio content play";

NSString *const imagePlay = @"play.png";
NSString *const imagePause = @"pause.png";
NSString *const imageUncheck = @"uncheck.png";
NSString *const imageCheck = @"checked.png";


@implementation ViewMain

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"ViewMain"
                                                          owner:self
                                                        options:nil];
        
        UIView* mainView = (UIView*)[nibViews objectAtIndex:0];
        [mainView setFrame:frame];
        [self addSubview:mainView];
    }
    [self initView];
    return self;
}

- (IBAction)_btnTestMode:(id)sender {
    if (self.isTestModeChecked) {
        self._imgTestMode.image = [UIImage imageNamed:imageUncheck];
        self.isTestModeChecked = false;
    } else {
        self._imgTestMode.image = [UIImage imageNamed:imageCheck];
        self.isTestModeChecked = true;
    }
}

- (IBAction)_btnSkip:(id)sender {
    NSLog(@"skip---------------");
    [self.soundCastController stopMedia];
    [self.timer invalidate];
    [self didPlayToEndAd];
}

- (IBAction)_btnMidRoll:(id)sender {
    if (self.isRollChecked) {
        self._imgMidRoll.image = [UIImage imageNamed:imageUncheck];
        self.isRollChecked = false;
    } else {
        self._imgMidRoll.image = [UIImage imageNamed:imageCheck];
        self.isRollChecked = true;
    }
}

- (IBAction)_btnPlay:(id)sender {
    if (self.isMedia == -1) {
        [self.soundCastController enableTestMode:self.isTestModeChecked];
        if (self.isRollChecked) {
            [self.soundCastController setAdsZone:Constants.mid_roll :10];
        } else {
            [self.soundCastController setAdsZone:Constants.pre_roll :0];
        }
        [self initViewMedia];
        [self addValues:CallAd];
        int networkID = [self._tfNetworkID.text integerValue];
        int siteID = [self._tfSiteID.text integerValue];
        int tagID = [self._tfTagID.text integerValue];
        [self.soundCastController loadAd:networkID : siteID : tagID :@"" :@"" :@"" :@"" :@""];
    } else if (self.isMedia == 1) {
        if (self.isPlayed) {
            [self pause];
        } else {
            [self play];
        }
    } else {
        NSLog(@"play/pause ad --------------");
        if ([self.soundCastController isPlayAd]) {
            [self.soundCastController skipAd];
//            [self.soundCastController pause];
//        } else {
//            [self.soundCastController play];
        }
    }
}

- (IBAction)_btnStop:(id)sender {
    [self stop];
}

- (IBAction)didChangeSlider:(id)sender {
    if (self.isMedia == 1) {
        CMTime const duration = [self.avPlayer currentItem].asset.duration;
        Float64 const secondsTotal = CMTimeGetSeconds(duration);
        int const timeTotal = (int)secondsTotal;
        [self.avPlayer seekToTime:CMTimeMakeWithSeconds(self._sliderTime.value, timeTotal)];
    }
}

- (void) play {
    NSLog(@"play---------");
    [self setImageButton:__btnPlay image:imagePause];
    [self.avPlayer play];
    self.isPlayed = true;
    [self setupTimer];
    [self.timer fire];
}

- (void) pause {
    NSLog(@"pause-----------");
    [self setImageButton:self._btnPlay image:imagePlay];
    self.isPlayed = false;
    [self.avPlayer pause];
    [self.timer invalidate];
}

- (void) stop {
    if (self.isMedia == -1 || self.isMedia == 1) {
        [self setImageButton:self._btnPlay image:imagePlay];
        [self initViewMedia];
        [self endPlayItem];
    } else {
        [self.soundCastController skipAd];
//        NSLog(@"skip---------------");
//        [self.soundCastController stopMedia];
//        [self.timer invalidate];
//        [self didPlayToEndAd];
    }
}

- (void) endPlayItem {
    [self.avPlayer seekToTime:kCMTimeZero];
    [self.avPlayer replaceCurrentItemWithPlayerItem:nil];
}

- (void)setupTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:true];
}

- (void)tick {
    @try {
        int32_t timeCurrent = (int32_t)CMTimeGetSeconds([self.avPlayer currentTime]);
        int32_t timeTotal = (int32_t)CMTimeGetSeconds([[[self.avPlayer currentItem] asset] duration]);
        [self updateValueSlider:(float)timeCurrent];
        [self initSlider:(float)timeTotal currentTime:(float)timeCurrent];
        [self setImageButton:self._btnPlay image:imagePause];
        if (timeCurrent == 10) {
                if([[self.soundCastController getAdsZone] isEqualToString:Constants.mid_roll] && [[[self.soundCastController getResponseModel] getMode] isEqualToString:Constants.test]) {
                    [self pause];
                    [self playAdMedia];
                }
        } else if (timeCurrent == timeTotal) {
            [self.timer invalidate];
            [self endPlayItem];
            [self.avPlayer replaceCurrentItemWithPlayerItem:nil];
            [self didPlayToEnd];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", ErrorSoundCast.PlayMedia);
    }
}

- (void)initView {
    self.avPlayerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"https://demo-stg.soundcast.fm/assets/audio/going-blind-court_1.mp3"]];
    self.avPlayer = [[AVPlayer alloc] init];
    self.isPlayed = false;
    self.isMedia = -1;
    self.isRollChecked = false;
    self.isTestModeChecked = false;
    self.colors = @{ @"call": [UIColor colorWithRed:0.767790234 green:0.9747441541 blue:0.9868099304 alpha:1], @"complete": [UIColor colorWithRed:0.7091954836 green:0.9788523707 blue:0.721101007 alpha:1], @"playing": [UIColor colorWithRed:0.8039215803 green:0.8039215803 blue:0.8039215803 alpha:1], @"error": [UIColor colorWithRed:0.9868099304 green:0.7479215957 blue:0.7550354997 alpha:1]};
    [self initTableView];
    [self initSoundCastSdk];
    [self initSlider];
}

- (void)initSoundCastSdk {
    self.soundCastController = [[SoundCastController alloc] init];
    self.soundCastController.delegate = self;
    self.soundCastController.dataSource = self;
}

- (void)initTableView {
    self._tbvEvent.delegate = self;
    self._tbvEvent.dataSource = self;
    [self._tbvEvent registerNib:[UINib nibWithNibName:@"TableViewCellEvent" bundle:nil] forCellReuseIdentifier:@"cellEvent"];
    self.datas = [[NSMutableArray alloc] init];
}

- (void)initSlider {
    [self.timer invalidate];
    self._sliderTime.value = 0;
    self._sliderTime.minimumValue = 0;
    self._sliderTime.maximumValue = 0;
    self._lblCurrentTime.text = @"-";
    self._lblTotalTime.text = @"-";
}

- (void)initViewMedia {
    [self initSlider];
    [self _btnSkip].hidden = true;
    self.isMedia = -1;
    [self.datas removeAllObjects];
    [self._tbvEvent reloadData];
}

- (void)initSlider:(float)total currentTime:(float)currentTime {
    self._lblTotalTime.text = [NSString stringWithFormat:@"%d", (int)total];
    self._lblCurrentTime.text = [NSString stringWithFormat:@"%d", (int)currentTime];
    self._sliderTime.minimumValue = 0;
    self._sliderTime.maximumValue = total;
}

- (void)setupView {
    [self.timer invalidate];
    [self _btnSkip].hidden = true;
    [self initSoundCastSdk];
    [self initTableView];
}

- (void)setImageButton: (UIButton*)sender image:(NSString*)image {
    [sender setImage:[UIImage imageNamed:image] forState:normal];
}

- (void)updateValueSlider: (float)value {
    self._lblCurrentTime.text = [NSString stringWithFormat:@"%d",(int)value];
    [self._sliderTime setValue:value animated:true];
}

- (void)addValues: (NSString*)value {
    if (![self isExist:_datas item:value]) {
        [self.datas addObject:value];
        [self._tbvEvent reloadData];
    }
}

- (Boolean)isExist:(NSArray*)list item:(NSString*)item {
    if ([list count] != 0) {
        for (NSString *i in list) {
            if (i == item) {
                return true;
            }
        }
    }
    return false;
}

- (void)showDialog:(NSString*)title content:(NSString*)content {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:nil];
    [alert addAction:yesButton];
    
    @try {
        [self.rootVC presentViewController:alert animated:YES completion:nil];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

- (void)playAdMedia {
    @try {
        if ([self.avPlayer currentItem]) {
            [self pause];
            [self initViewMedia];
        }
        self.isMedia = 0;
        [self setImageButton:self._btnPlay image:imagePause];
        [self.soundCastController playAd];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

- (void)playSound {
    @try {
        [self addValues:PlayContent];
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        [self.avPlayer replaceCurrentItemWithPlayerItem:self.avPlayerItem];
        if (@available(iOS 10.0, *)) {
            self.avPlayer.automaticallyWaitsToMinimizeStalling = false;
        } else {
            // Fallback on earlier versions
        }
        self.isPlayed = true;
        self.isMedia = 1;
        [self setupTimer];
        [self.avPlayer play];
    } @catch (NSException *exception) {
        [self showDialog:@"Error" content:@"Can't not play media"];
    }
}

- (void)didClickThrough {
    
}

- (void)didClickTracking {
    
}

- (void)didCompanionClickThrough {
    
}

- (void)didCompanionClickTracking {
    
}

- (void)didCompanionCreativeView {
    
}

- (void)didCreativeView {
    
}

- (void)didError {
    
}

- (void)didFirstQuartile {
    NSLog(@"first-----------");
    [self addValues:FirstQuartile];
    [self updateValueSlider:[self.soundCastController getTimeCurrent]];
}

- (void)didImpression {
    
}

- (void)didMidPoint {
    NSLog(@"mid---------------");
    [self addValues:MidPoint];
    [self updateValueSlider:[self.soundCastController getTimeCurrent]];
}

- (void)didPause {
    
}

- (void)didPlayToEndAd {
    NSLog(@"end ad----------------");
    [self setImageButton:self._btnPlay image:imagePlay];
    [self addValues:Complete];
    self._btnSkip.hidden = YES;
    [self initSlider];
    self.isMedia = -1;
    [self playSound];
}

- (void)didPlayToEnd {
    NSLog(@"finish--------");
    [self setImageButton:__btnPlay image:imagePlay];
    [self initViewMedia];
    [self._tbvEvent reloadData];
}

- (void)didResume {
    
}

- (void)didRewind {
    
}

- (void)didSkip {
    
}

- (void)didStart {
    NSLog(@"ad start----------");
    [self setImageButton:self._btnPlay image:imagePause];
    [self initSlider:[self.soundCastController getTimeTotal] currentTime:0];
    [self addValues:StartAd];
}

- (void)didThirdQuartile {
    NSLog(@"third---------------");
    [self addValues:ThirdQuartile];
    [self updateValueSlider:[self.soundCastController getTimeCurrent]];
}

- (void)onErrorLoadMediaWithError:(NSString * _Nonnull)error {
    NSLog(@"error play ---------------");
    [self playAdMedia];
}

- (void)onErrorWithError:(NSString * _Nonnull)error {
    [self showDialog:@"Error" content:error];
}

- (void)playing {
    NSLog(@"%f---------------------",self.soundCastController.getTimeCurrent);
    [self updateValueSlider:(self.soundCastController.getTimeCurrent)];
}

- (void)showButtonSkip {
    self._btnSkip.hidden = NO;
}

- (void)onErrorTrackingWithError:(NSString * _Nonnull)error {
    // response tracking error
    NSLog(@"error on client=======\n\(error)\n============");
}


- (void)didFinishNotAd {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self addValues:ErrorAd];
        [self playSound];
    });
}

- (void)didFinishWithAd {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([[self.soundCastController getAdsZone] isEqualToString:Constants.mid_roll]) {
            NSLog(@"mid-----------");
            [self playSound];
        } else {
            NSLog(@"pre----------");
            [self playAdMedia];
        }
    });
}

- (void)didFinishTrackEventWithResponse:(NSDictionary<NSString *,id> *)response {
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TableViewCellEvent *cell = (TableViewCellEvent *)[tableView dequeueReusableCellWithIdentifier:@"cellEvent" forIndexPath:indexPath];
    UIColor *bg_color;
    NSString *str = [self.datas objectAtIndex:indexPath.row];
    if ([str isEqualToString:ErrorAd]) {
        bg_color = self.colors[@"error"];
    } else if ([str isEqualToString:Complete]) {
        bg_color = self.colors[@"complete"];
    } else if ([str isEqualToString:PlayContent]) {
        bg_color = self.colors[@"playing"];
    } else {
        bg_color = self.colors[@"call"];
    }
    [cell setContent:str bg_color:bg_color];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

@end
