//
//  ManagedObject.m
//  GetYT
//
//  Created by iOS developer on 25/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "ManagedObject.h"
#import "CoreDataController.h"

@implementation NSManagedObject (ManagedObject)

+ (instancetype)newObject {
    return [[CoreDataController sharedInstance] newObjectForClass:[self class]];
}

- (void)delegeteObject {
    [[CoreDataController sharedInstance] removeObject:self];
}

@end
