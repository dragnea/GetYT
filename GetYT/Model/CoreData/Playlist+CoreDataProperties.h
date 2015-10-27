//
//  Playlist+CoreDataProperties.h
//  GetYT
//
//  Created by iOS developer on 25/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Playlist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Playlist (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *defaultPlaylist;
@property (nullable, nonatomic, retain) NSSet<Song *> *songs;

@end

@interface Playlist (CoreDataGeneratedAccessors)

- (void)addSongsObject:(Song *)value;
- (void)removeSongsObject:(Song *)value;
- (void)addSongs:(NSSet<Song *> *)values;
- (void)removeSongs:(NSSet<Song *> *)values;

@end

NS_ASSUME_NONNULL_END
