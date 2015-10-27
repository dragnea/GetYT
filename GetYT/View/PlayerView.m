//
//  PlayerView.m
//  GetYT
//
//  Created by iOS developer on 11/10/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]]) {
        self.frame = frame;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    _playButton = [[PlayButton alloc] initWithFrame:CGRectMake(50.0, 80.0, 50.0, 50.0)];
    [self.contentView addSubview:_playButton];
}

@end
