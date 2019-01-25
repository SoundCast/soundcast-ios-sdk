//
//  TableViewCellEvent.h
//  SoundCastSampleObjectiveC
//
//  Created by Tran Nghia Hiep on 9/19/18.
//  Copyright © 2018 SoundCast. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCellEvent : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *_lblContent;
- (void)setContent: (NSString*)content bg_color:(UIColor*)bg_color;
@end

NS_ASSUME_NONNULL_END
