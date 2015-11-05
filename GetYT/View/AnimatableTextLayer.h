//
//  AnimatableTextLayer.h
//  GetYT
//
//  Created by Mihai Dragnea on 11/5/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CATransactionAdditions.h"

@interface AnimatableTextLayer : CATextLayer
@property (nonatomic, strong, nullable) NSSet *animatableKeys;
@end
