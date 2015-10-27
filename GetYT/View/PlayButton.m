//
//  PlayButton.m
//  GetYT
//
//  Created by iOS developer on 28/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayButton.h"
#import "GYTTheme.h"
#import "AnimatableShapeLayer.h"

@interface PlayButton ()
@property (nonatomic, strong) AnimatableShapeLayer *leftLayer;
@property (nonatomic, strong) AnimatableShapeLayer *rightLayer;
@property (nonatomic, strong) AnimatableShapeLayer *circleLayer;
@end

@implementation PlayButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupLayers];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setupLayers];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupLayers];
    }
    return self;
}

- (void)setupLayers {
    
    _showCircle = NO;
    _showPause = NO;
    
    _leftLayer = [AnimatableShapeLayer layer];
    _rightLayer = [AnimatableShapeLayer layer];
    _circleLayer = [AnimatableShapeLayer layer];
    
    _circleLayer.path = CGPathCreateWithEllipseInRect(self.bounds, NULL);
    _circleLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:_circleLayer];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0.0, 0.0);
    CGPathAddLineToPoint(path, NULL, self.bounds.size.width, CGRectGetMidY(self.bounds));
    CGPathAddLineToPoint(path, NULL, 0.0, self.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, 0.0, self.bounds.size.height);
    _leftLayer.path = path;
    _leftLayer.fillColor = [GYTTheme colorWhiteHighlighted].CGColor;
    [self.layer addSublayer:_leftLayer];
    
    _rightLayer.path = path;
    _rightLayer.fillColor = [GYTTheme colorWhiteHighlighted].CGColor;
    [self.layer addSublayer:_rightLayer];
}

- (void)setShowPause:(BOOL)showPause {
    _showPause = showPause;
    
    if (_showPause) {
        CGFloat division = self.bounds.size.width / 5.0;
        self.leftLayer.path = CGPathCreateWithRect(CGRectMake(division, 0.0, division, self.bounds.size.height), NULL);
        self.rightLayer.path = CGPathCreateWithRect(CGRectMake(division * 3, 0.0, division, self.bounds.size.height), NULL);
        
    } else {
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0.0, 0.0);
        CGPathAddLineToPoint(path, NULL, self.bounds.size.width, CGRectGetMidY(self.bounds));
        CGPathAddLineToPoint(path, NULL, 0.0, self.bounds.size.height);
        CGPathAddLineToPoint(path, NULL, 0.0, self.bounds.size.height);
        self.leftLayer.path = path;
        self.rightLayer.path = path;
        
    }
}

- (void)setShowCircle:(BOOL)showCircle {
    _showCircle = showCircle;
    
    if (_showCircle) {
        
        self.leftLayer.fillColor = [GYTTheme colorRed].CGColor;
        self.rightLayer.fillColor = [GYTTheme colorRed].CGColor;
        self.circleLayer.fillColor = [GYTTheme colorWhiteNormal].CGColor;
        
    } else {
        
        self.leftLayer.fillColor = [GYTTheme colorWhiteHighlighted].CGColor;
        self.rightLayer.fillColor = [GYTTheme colorWhiteHighlighted].CGColor;
        self.circleLayer.fillColor = [UIColor clearColor].CGColor;
        
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.showPause = !self.showPause;
}

@end
