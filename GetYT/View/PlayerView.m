//
//  PlayerView.m
//  GetYT
//
//  Created by iOS developer on 11/10/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayerView.h"
#import "PlayButton.h"
#import "GYTTheme.h"

@interface PlayerView ()
@property (nonatomic, strong, readonly) NSLayoutConstraint *playButtonAlignXConstraint;
@property (nonatomic, strong, readonly) NSLayoutConstraint *playButtonSizeConstraint;
@property (nonatomic, strong, readonly) NSLayoutConstraint *prevButtonLeftConstraint;
@property (nonatomic, strong, readonly) NSLayoutConstraint *nextButtonRightConstraint;
@property (nonatomic, strong, readonly) NSLayoutConstraint *horizontalAlignMaximizeConstraint;
@property (nonatomic, strong, readonly) NSLayoutConstraint *layoutBottomConstraint;
@property (nonatomic, strong, readonly) NSLayoutConstraint *songSliderLeftConstraint;
@property (nonatomic, strong, readonly) NSLayoutConstraint *songSliderBottomConstraint;
@end

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
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    /*
     menu button
     */
    
    _menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _menuButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_menuButton setImage:[UIImage imageNamed:@"button_menu"] forState:UIControlStateNormal];
    [self.contentView addSubview:_menuButton];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_menuButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_menuButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_menuButton
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:10.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_menuButton
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:30.0]];
    
    /*
     play button
     */
    
    _playButton = [PlayButton buttonWithType:UIButtonTypeCustom];
    _playButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_playButton addTarget:self action:@selector(playButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    _playButton.paused = YES;
    _playButton.fullscreen = NO;
    _playButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_playButton];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_playButton
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_playButton
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_playButton
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    _playButtonSizeConstraint = [NSLayoutConstraint constraintWithItem:_playButton
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1.0
                                                              constant:50.0];
    [self.contentView addConstraint:_playButtonSizeConstraint];
    _playButtonAlignXConstraint = [NSLayoutConstraint constraintWithItem:_playButton
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0];
    [self.contentView addConstraint:_playButtonAlignXConstraint];
    
    /*
     previous button
     */
    
    _prevButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _prevButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_prevButton setImage:[UIImage imageNamed:@"control_prev"] forState:UIControlStateNormal];
    [self.contentView addSubview:_prevButton];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_prevButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_prevButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_prevButton
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    _prevButtonLeftConstraint = [NSLayoutConstraint constraintWithItem:_prevButton
                                                             attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_playButton
                                                             attribute:NSLayoutAttributeLeading
                                                            multiplier:1.0
                                                              constant:70.0];
    [self.contentView addConstraint:_prevButtonLeftConstraint];
    
    /*
     next button
     */
    
    _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_nextButton setImage:[UIImage imageNamed:@"control_next"] forState:UIControlStateNormal];
    [self.contentView addSubview:_nextButton];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_nextButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_nextButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_nextButton
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    _nextButtonRightConstraint = [NSLayoutConstraint constraintWithItem:_nextButton
                                                              attribute:NSLayoutAttributeLeading
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:_playButton
                                                              attribute:NSLayoutAttributeTrailing
                                                             multiplier:1.0
                                                               constant:120.0];
    [self.contentView addConstraint:_nextButtonRightConstraint];
    
    /*
     song position slider
     */
    
    _songPositionSlider = [[UISlider alloc] init];
    _songPositionSlider.translatesAutoresizingMaskIntoConstraints = NO;
    _songPositionSlider.minimumTrackTintColor = [UIColor whiteColor];
    _songPositionSlider.maximumTrackTintColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [_songPositionSlider setThumbImage:[UIImage imageNamed:@"control_slider"] forState:UIControlStateNormal];
    [self.contentView addSubview:_songPositionSlider];
    _songSliderBottomConstraint = [NSLayoutConstraint constraintWithItem:_songPositionSlider
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.contentView
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:-20.0];
    [self.contentView addConstraint:_songSliderBottomConstraint];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_songPositionSlider
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_songPositionSlider
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:-30.0]];
    _songSliderLeftConstraint = [NSLayoutConstraint constraintWithItem:_songPositionSlider
                                                             attribute:NSLayoutAttributeLeading
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.contentView
                                                             attribute:NSLayoutAttributeLeading
                                                            multiplier:1.0
                                                              constant:50.0];
    [self.contentView addConstraint:_songSliderLeftConstraint];
    
    /*
     maximize button
     */
    
    _maximizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _maximizeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_maximizeButton setImage:[UIImage imageNamed:@"control_maximize"] forState:UIControlStateNormal];
    [_maximizeButton addTarget:self action:@selector(maximizeButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_maximizeButton];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_maximizeButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_maximizeButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:30.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_maximizeButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:-10.0]];
    _horizontalAlignMaximizeConstraint = [NSLayoutConstraint constraintWithItem:_maximizeButton
                                                                      attribute:NSLayoutAttributeLeading
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.contentView
                                                                      attribute:NSLayoutAttributeLeading
                                                                     multiplier:1.0
                                                                       constant:10.0];
    [self.contentView addConstraint:_horizontalAlignMaximizeConstraint];
    
    self.state = PlayerViewState_normal;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                               attribute:NSLayoutAttributeTrailing
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeTrailing
                                                              multiplier:1.0
                                                                constant:0.0]];
    _layoutBottomConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.superview
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:-(CGRectGetHeight(self.superview.bounds) - 180.0)];
    [self.superview addConstraint:_layoutBottomConstraint];
}

- (void)setState:(PlayerViewState)state {
    _state = state;
    
    switch (_state) {
        case PlayerViewState_fullscreen:
            self.songSliderBottomConstraint.constant = -80.0;
            self.songSliderLeftConstraint.constant = 30.0;
            self.playButtonAlignXConstraint.constant = 0.0;
            self.playButtonSizeConstraint.constant = 160.0;
            self.prevButtonLeftConstraint.constant = -20.0;
            self.nextButtonRightConstraint.constant = 20.0;
            self.horizontalAlignMaximizeConstraint.constant = self.bounds.size.width - self.maximizeButton.bounds.size.width - 12.0;
            self.layoutBottomConstraint.constant = 0.0;
            self.playButton.fullscreen = YES;
            break;
            
        case PlayerViewState_normal:
            self.songSliderBottomConstraint.constant = -20.0;
            self.songSliderLeftConstraint.constant = 70.0;
            self.playButtonAlignXConstraint.constant = - (CGRectGetMidX(self.bounds) - 80.0);
            self.playButtonSizeConstraint.constant = 50.0;
            self.prevButtonLeftConstraint.constant = 110.0;
            self.nextButtonRightConstraint.constant = 90.0;
            self.horizontalAlignMaximizeConstraint.constant = 12.0;
            self.layoutBottomConstraint.constant = -(CGRectGetHeight(self.superview.bounds) - 180.0);
            self.playButton.fullscreen = NO;
        default:
            break;
    }
    
    [UIView animateWithDuration:0.5
                          delay:0.0
         usingSpringWithDamping:1.0
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                        
                         [self.superview layoutIfNeeded];
                         
                     } completion:^(BOOL finished) {
                         
                     }];
}

#pragma mark - Buttons actions

- (void)maximizeButtonTouched {
    if (self.state == PlayerViewState_normal) {
        self.state = PlayerViewState_fullscreen;
    } else {
        self.state = PlayerViewState_normal;
    }
}

- (void)playButtonTouched {
    self.playButton.paused = !self.playButton.paused;
}

@end
