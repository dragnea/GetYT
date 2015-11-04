//
//  PlayButton.m
//  GetYT
//
//  Created by iOS developer on 27/10/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayButton.h"

@implementation PlayButton

- (void)setPaused:(BOOL)paused {
    _paused = paused;
    
    [UIView transitionWithView:self
                      duration:0.3
                       options:UIViewAnimationOptionCurveEaseOut
                    animations:^{
                        
                        if (_paused) {
                            [self setImage:[UIImage imageNamed:self.fullscreen ? @"control_pause_fullscreen" : @"control_pause_normal"] forState:UIControlStateNormal];
                        } else {
                            [self setImage:[UIImage imageNamed:self.fullscreen ? @"control_play_fullscreen" : @"control_play_normal"] forState:UIControlStateNormal];
                        }
                        
                    } completion:^(BOOL finished) {
                        
                    }];
}

- (void)setFullscreen:(BOOL)fullscreen {
    _fullscreen = fullscreen;
    
    [UIView transitionWithView:self
                      duration:0.3
                       options:UIViewAnimationOptionCurveEaseOut
                    animations:^{
                        if (_fullscreen) {
                            [self setImage:[UIImage imageNamed:self.paused ? @"control_pause_fullscreen" : @"control_play_fullscreen"] forState:UIControlStateNormal];
                        } else {
                            [self setImage:[UIImage imageNamed:self.paused ? @"control_pause_normal" : @"control_play_normal"] forState:UIControlStateNormal];
                        }
                    } completion:^(BOOL finished) {
                        
                    }];
}

@end
