//
//  CoreDataController.h
//  GetYT
//
//  Created by Mihai Dragnea on 9/16/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataController : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CoreDataController *)sharedInstance;
- (NSArray *)fetchModelClass:(Class)modelClass withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray<NSSortDescriptor *> *)sortDescriptors;
- (id)newObjectForClass:(Class)class;
- (void)removeObject:(id)object;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
