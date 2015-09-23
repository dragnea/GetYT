//
//  MenuButton.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/22/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "MenuButton.h"

@interface MenuButton ()
@property (nonatomic, strong, readonly) CAShapeLayer *line1Layer;
@property (nonatomic, strong, readonly) CAShapeLayer *line2Layer;
@property (nonatomic, strong, readonly) CAShapeLayer *line3Layer;
@property (nonatomic, strong, readonly) CABasicAnimation *line1Animation;
@property (nonatomic, strong, readonly) CABasicAnimation *line3Animation;
@end

@implementation MenuButton

- (void)layoutSubviews {
    [super layoutSubviews];
    [self initLayout];
}

- (CGPathRef)lineFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, fromPoint.x, fromPoint.y);
    CGPathAddLineToPoint(path, NULL, toPoint.x, toPoint.y);
    return path;
}

- (void)initLayout {
    
    CGFloat leftXPoint = (self.bounds.size.width - 20.0) / 2.0;
    CGFloat rightXPoint = (self.bounds.size.width - 20.0) / 2.0 + 20.0;
    CGFloat midYPoint = CGRectGetMidY(self.bounds);
    
    if (!_line1Layer) {
        _line1Layer = [CAShapeLayer layer];
        _line1Layer.strokeColor = [UIColor darkGrayColor].CGColor;
        _line1Layer.fillColor = [UIColor clearColor].CGColor;
        _line1Layer.lineWidth = 2.0;
        _line1Layer.lineCap = kCALineCapRound;
        _line1Layer.path = [self lineFromPoint:CGPointMake(leftXPoint, midYPoint - 5.0) toPoint:CGPointMake(rightXPoint, midYPoint - 5.0)];
        [self.layer addSublayer:_line1Layer];
        
    }
    
    if (!_line2Layer) {
        _line2Layer = [CAShapeLayer layer];
        _line2Layer.strokeColor = [UIColor darkGrayColor].CGColor;
        _line2Layer.fillColor = [UIColor clearColor].CGColor;
        _line2Layer.lineWidth = 2.0;
        _line2Layer.lineCap = kCALineCapRound;
        _line2Layer.path = [self lineFromPoint:CGPointMake(leftXPoint, midYPoint) toPoint:CGPointMake(rightXPoint, midYPoint)];
        [self.layer addSublayer:_line2Layer];
    }
    
    if (!_line3Layer) {
        _line3Layer = [CAShapeLayer layer];
        _line3Layer.strokeColor = [UIColor darkGrayColor].CGColor;
        _line3Layer.fillColor = [UIColor clearColor].CGColor;
        _line3Layer.lineWidth = 2.0;
        _line3Layer.lineCap = kCALineCapRound;
        _line3Layer.path = [self lineFromPoint:CGPointMake(leftXPoint, midYPoint + 5.0) toPoint:CGPointMake(rightXPoint, midYPoint + 5.0)];
        [self.layer addSublayer:_line3Layer];
    }
    
}

- (void)setAnimationFrameValue:(CGFloat)animationFrameValue {
    if (animationFrameValue < 0.0) {
        _animationFrameValue = 0.0;
    } else if (animationFrameValue > 1.0) {
        _animationFrameValue = 1.0;
    } else {
        _animationFrameValue = animationFrameValue;
    }
    
    CGFloat leftXPoint = (self.bounds.size.width - 20.0) / 2.0;
    CGFloat rightXPoint = (self.bounds.size.width - 20.0) / 2.0 + 20.0;
    CGFloat midYPoint = CGRectGetMidY(self.bounds);

    self.line1Layer.path = [self lineFromPoint:CGPointMake(leftXPoint, midYPoint - (5.0 - _animationFrameValue * 5))
                                       toPoint:CGPointMake(rightXPoint, midYPoint - 5.0 - _animationFrameValue * 5)];
    
    self.line2Layer.path = [self lineFromPoint:CGPointMake(leftXPoint + _animationFrameValue * 20.0, midYPoint - _animationFrameValue * 10)
                                       toPoint:CGPointMake(rightXPoint, midYPoint + _animationFrameValue * 10)];
    
    self.line3Layer.path = [self lineFromPoint:CGPointMake(leftXPoint, midYPoint + (5.0 - _animationFrameValue * 5))
                                       toPoint:CGPointMake(rightXPoint, midYPoint + 5.0 + _animationFrameValue * 5)];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
