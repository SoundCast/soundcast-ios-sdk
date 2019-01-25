//
//  TableViewCellEvent.m
//  SoundCastSampleObjectiveC
//
//  Created by Tran Nghia Hiep on 9/19/18.
//  Copyright © 2018 SoundCast. All rights reserved.
//

#import "TableViewCellEvent.h"

@implementation TableViewCellEvent

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[__lblContent layer] setCornerRadius: 3];
    [[__lblContent layer] setMasksToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setContent: (NSString*)content bg_color:(UIColor*)bg_color {
    __lblContent.text = content;
    __lblContent.backgroundColor = bg_color;
    
}

@end
