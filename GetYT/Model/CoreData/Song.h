//
//  Song.h
//  GetYT
//
//  Created by Mihai Dragnea on 9/16/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Song : NSManagedObject
@property (nonatomic, readonly) BOOL fileExists;

@end

NS_ASSUME_NONNULL_END

#import "Song+CoreDataProperties.h"
