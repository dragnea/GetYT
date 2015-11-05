//
//  CATransactionAdditions.m
//  GetYT
//
//  Created by Mihai Dragnea on 11/5/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "CATransactionAdditions.h"

@implementation CATransaction (CATransactionAdditions)

+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(nullable void (^)(void))animations
                 completion:(nullable void (^)(void))completion {
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    
    if (completion) {
        [CATransaction setCompletionBlock:completion];
    }
    
    if (animations) {
        animations();
    }
    
    [CATransaction commit];
}

@end
