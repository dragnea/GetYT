//
//  ManagedObject.h
//  GetYT
//
//  Created by iOS developer on 25/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (ManagedObject)

+ (instancetype)newObject;
- (void)delegeteObject;

@end
