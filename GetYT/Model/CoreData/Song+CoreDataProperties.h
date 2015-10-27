//
//  Song+CoreDataProperties.h
//  GetYT
//
//  Created by Mihai Dragnea on 9/16/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface Song (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *file;
@property (nullable, nonatomic, retain) NSNumber *index;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSDate *dateAdded;
@property (nullable, nonatomic, retain) Playlist *playlist;

@end

NS_ASSUME_NONNULL_END
