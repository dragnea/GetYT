//
//  AnimatableShapeLayer.h
//  GetYT
//
//  Created by Mihai Dragnea on 9/23/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CATransactionAdditions.h"

@interface AnimatableShapeLayer : CAShapeLayer
@property (nonatomic, strong, nullable) NSSet *animatableKeys;
@end
