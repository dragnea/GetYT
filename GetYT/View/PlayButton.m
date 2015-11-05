//
//  PlayButton.m
//  GetYT
//
//  Created by iOS developer on 27/10/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayButton.h"
#import "AnimatableShapeLayer.h"

@interface PlayButton ()
@property (nonatomic, strong) AnimatableShapeLayer *imageLayer;
@end

@implementation PlayButton

- (AnimatableShapeLayer *)imageLayer {
    if (!_imageLayer) {
        _imageLayer = [AnimatableShapeLayer layer];
        _imageLayer.contentsScale = [UIScreen mainScreen].scale;
        _imageLayer.contentsGravity = kCAGravityCenter;
        _imageLayer.animatableKeys = [NSSet setWithObject:@"contents"];
        [self.layer addSublayer:_imageLayer];
    }
    return _imageLayer;
}

- (void)setPaused:(BOOL)paused {
    _paused = paused;
    
    if (_paused) {
        self.image = [UIImage imageNamed:self.fullscreen ? @"control_pause_fullscreen" : @"control_pause_normal"];
    } else {
        self.image = [UIImage imageNamed:self.fullscreen ? @"control_play_fullscreen" : @"control_play_normal"];
    }
}

- (void)setFullscreen:(BOOL)fullscreen {
    _fullscreen = fullscreen;
    if (_fullscreen) {
        self.image = [UIImage imageNamed:self.paused ? @"control_pause_fullscreen" : @"control_play_fullscreen"];
    } else {
        self.image = [UIImage imageNamed:self.paused ? @"control_pause_normal" : @"control_play_normal"];
    }
}

- (void)setImage:(UIImage *)image {
    [CATransaction animateWithDuration:0.25
                            animations:^{
                                
                                self.imageLayer.contents = (__bridge id)image.CGImage;
                                
                            } completion:^{
                                
                            }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageLayer.frame = self.bounds;
}

@end
