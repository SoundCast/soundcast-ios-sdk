//
//  ViewController.m
//  SoundCastSampleObjectiveC
//
//  Created by Tran Nghia Hiep on 9/18/18.
//  Copyright © 2018 SoundCast. All rights reserved.
//

#import "ViewController.h"
#import "ViewMain.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ViewMain *viewMain = [[ViewMain alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    viewMain.rootVC = self;
    [self._view addSubview:viewMain];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
