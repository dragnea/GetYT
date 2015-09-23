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
        return nil;
    } else {
        return [super actionForKey:event];
    }
}

@end
