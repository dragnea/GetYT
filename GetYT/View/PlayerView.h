//
//  PlayerView.h
//  GetYT
//
//  Created by iOS developer on 11/10/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlayButton, SongsPreviewView;

typedef NS_OPTIONS(NSInteger, PlayerViewState) {
    PlayerViewState_normal,
    PlayerViewState_fullscreen
};

@interface PlayerView : UIVisualEffectView
@property (nonatomic, strong, readonly) UIButton *menuButton;
@property (nonatomic, strong, readonly) PlayButton *playButton;
@property (nonatomic, strong, readonly) UIButton *prevButton;
@property (nonatomic, strong, readonly) UIButton *nextButton;
@property (nonatomic, strong, readonly) UIButton *maximizeButton;
@property (nonatomic, strong, readonly) UISlider *songPositionSlider;
@property (nonatomic, strong, readonly) UILabel *songPositionLabel;
@property (nonatomic, strong, readonly) SongsPreviewView *songsPreviewView;
@property (nonatomic) PlayerViewState state;

@end
