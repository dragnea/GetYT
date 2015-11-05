//
//  CATransactionAdditions.h
//  GetYT
//
//  Created by Mihai Dragnea on 11/5/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATransaction (CATransactionAdditions)

+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(nullable void (^)(void))animations
                 completion:(nullable void (^)(void))completion;

@end
