//
//  SongsPreviewView.m
//  GetYT
//
//  Created by Mihai Dragnea on 11/5/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "SongsPreviewView.h"
#import "AnimatableTextLayer.h"

const NSInteger heigh = 120.0;

@interface SongsPreviewView ()
@property (nonatomic, strong, readonly) NSMutableArray<AnimatableTextLayer *> *textLayers;
@end

@implementation SongsPreviewView

- (id)init {
    if (self = [super init]) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    
    _fullscreen = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSSet *textAnimations = [NSSet setWithObjects:@"opacity", @"foregroundColor", @"fontSize", @"anchorPoint", nil];
    CGRect textLayerFrame = CGRectMake(0.0, ceil(heigh / 2.0) - 10.0, [UIScreen mainScreen].bounds.size.width, heigh);
    
    AnimatableTextLayer *textLayer1 = [AnimatableTextLayer layer];
    textLayer1.contentsScale = [UIScreen mainScreen].scale;
    textLayer1.alignmentMode = kCAAlignmentCenter;
    textLayer1.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer1.font = (__bridge CFTypeRef)[UIFont fontWithName:@"AvenirNextCondensed-Medium" size:15.0];
    textLayer1.frame = textLayerFrame;
    textLayer1.animatableKeys = textAnimations;
    [self.layer addSublayer:textLayer1];
    
    AnimatableTextLayer *textLayer2 = [AnimatableTextLayer layer];
    textLayer2.contentsScale = [UIScreen mainScreen].scale;
    textLayer2.alignmentMode = kCAAlignmentCenter;
    textLayer2.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer2.font = (__bridge CFTypeRef)[UIFont fontWithName:@"AvenirNextCondensed-Medium" size:15.0];
    textLayer2.frame = textLayerFrame;
    textLayer2.animatableKeys = textAnimations;
    [self.layer addSublayer:textLayer2];
    
    AnimatableTextLayer *textLayer3 = [AnimatableTextLayer layer];
    textLayer3.contentsScale = [UIScreen mainScreen].scale;
    textLayer3.alignmentMode = kCAAlignmentCenter;
    textLayer3.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer3.font = (__bridge CFTypeRef)[UIFont fontWithName:@"AvenirNextCondensed-Medium" size:15.0];
    textLayer3.frame = textLayerFrame;
    textLayer3.animatableKeys = textAnimations;
    [self.layer addSublayer:textLayer3];
    
    AnimatableTextLayer *textLayer4 = [AnimatableTextLayer layer];
    textLayer4.contentsScale = [UIScreen mainScreen].scale;
    textLayer4.alignmentMode = kCAAlignmentCenter;
    textLayer4.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer4.font = (__bridge CFTypeRef)[UIFont fontWithName:@"AvenirNextCondensed-Medium" size:15.0];
    textLayer4.frame = textLayerFrame;
    textLayer4.animatableKeys = textAnimations;
    [self.layer addSublayer:textLayer4];
    
    AnimatableTextLayer *textLayer5 = [AnimatableTextLayer layer];
    textLayer5.contentsScale = [UIScreen mainScreen].scale;
    textLayer5.alignmentMode = kCAAlignmentCenter;
    textLayer5.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer5.font = (__bridge CFTypeRef)[UIFont fontWithName:@"AvenirNextCondensed-Medium" size:15.0];
    textLayer5.frame = textLayerFrame;
    textLayer5.animatableKeys = textAnimations;
    [self.layer addSublayer:textLayer5];
    
    _textLayers = [NSMutableArray arrayWithObjects:textLayer1, textLayer2, textLayer3, textLayer4, textLayer5, nil];
}

- (void)updateTexts {
    
    [CATransaction animateWithDuration:0.3
                            animations:^{
                                
                                AnimatableTextLayer *textLayer1 = self.textLayers[0];
                                AnimatableTextLayer *textLayer2 = self.textLayers[1];
                                AnimatableTextLayer *textLayer3 = self.textLayers[2];
                                AnimatableTextLayer *textLayer4 = self.textLayers[3];
                                AnimatableTextLayer *textLayer5 = self.textLayers[4];
                                
                                if (self.fullscreen) {
                                    
                                    textLayer1.opacity = 0.0;
                                    textLayer1.fontSize = 15.0;
                                    textLayer1.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer1.anchorPoint = CGPointMake(0.5, 0.0);
                                    
                                    textLayer2.opacity = 1.0;
                                    textLayer2.fontSize = 15.0;
                                    textLayer2.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer2.anchorPoint = CGPointMake(0.5, 0.2);
                                    
                                    textLayer3.opacity = 1.0;
                                    textLayer3.fontSize = 18.0;
                                    textLayer3.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.9].CGColor;
                                    textLayer3.anchorPoint = CGPointMake(0.5, 0.53);
                                    
                                    textLayer4.opacity = 1.0;
                                    textLayer4.fontSize = 15.0;
                                    textLayer4.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer4.anchorPoint = CGPointMake(0.5, 0.8);
                                    
                                    textLayer5.opacity = 0.0;
                                    textLayer5.fontSize = 15.0;
                                    textLayer5.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer5.anchorPoint = CGPointMake(0.5, 1.0);
                                    
                                } else {
                                    
                                    textLayer1.opacity = 0.0;
                                    textLayer1.fontSize = 15.0;
                                    textLayer1.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer1.anchorPoint = CGPointMake(0.5, 0.0);
                                    
                                    textLayer2.opacity = 0.0;
                                    textLayer2.fontSize = 15.0;
                                    textLayer2.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer2.anchorPoint = CGPointMake(0.5, 0.2);
                                    
                                    textLayer3.opacity = 1.0;
                                    textLayer3.fontSize = 18.0;
                                    textLayer3.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.9].CGColor;
                                    textLayer3.anchorPoint = CGPointMake(0.5, 0.53);
                                    
                                    textLayer4.opacity = 0.0;
                                    textLayer4.fontSize = 15.0;
                                    textLayer4.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer4.anchorPoint = CGPointMake(0.5, 0.8);
                                    
                                    textLayer5.opacity = 0.0;
                                    textLayer5.fontSize = 15.0;
                                    textLayer5.foregroundColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
                                    textLayer5.anchorPoint = CGPointMake(0.5, 1.0);
                                    
                                }
                                
                            } completion:^{
                                
                                
                                
                            }];
}

- (void)setFullscreen:(BOOL)fullscreen {
    _fullscreen = fullscreen;
    [self updateTexts];
}

- (void)moveToPreviousSong {
    if ([self.dataSource respondsToSelector:@selector(songsPreviewView:position:)]) {
        
        AnimatableTextLayer *previousLayer = self.textLayers.firstObject;
        previousLayer.string = [self.dataSource songsPreviewView:self position:SongsPreviewPosition_previous];
        
        AnimatableTextLayer *tempLayer = self.textLayers.lastObject;
        [self.textLayers removeLastObject];
        [self.textLayers insertObject:tempLayer atIndex:0];
        
        [self updateTexts];
    }
}

- (void)moveToNextSong {
    if ([self.dataSource respondsToSelector:@selector(songsPreviewView:position:)]) {
        
        AnimatableTextLayer *nextLayer = self.textLayers.lastObject;
        nextLayer.string = [self.dataSource songsPreviewView:self position:SongsPreviewPosition_next];
        
        AnimatableTextLayer *tempLayer = self.textLayers.firstObject;
        [self.textLayers removeObjectAtIndex:0];
        [self.textLayers addObject:tempLayer];
        
        [self updateTexts];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateTexts];
}

@end
