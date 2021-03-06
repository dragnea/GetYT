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
    if ([self.animatableKeys containsObject:event]) {
        return [self animationForKey:event];
    } else {
        return [super actionForKey:event];
    }
}

- (CABasicAnimation *)animationForKey:(NSString *)key {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
    animation.fromValue = [self.presentationLayer valueForKey:key];
    animation.duration = [CATransaction animationDuration];
    return animation;
}

@end
