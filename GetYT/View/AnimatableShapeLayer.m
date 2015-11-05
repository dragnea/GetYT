//
//  AnimatableShapeLayer.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/23/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "AnimatableShapeLayer.h"

@implementation AnimatableShapeLayer

- (id<CAAction>)actionForKey:(NSString *)event {
    if ([event isEqualToString:@"path"]) {
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.3 :0.9 :0.8 :1.0];
        pathAnimation.fromValue = [self.presentationLayer valueForKey:event];
        pathAnimation.duration = 0.25;
        return pathAnimation;
    } else {
        return [super actionForKey:event];
    }
}

@end
