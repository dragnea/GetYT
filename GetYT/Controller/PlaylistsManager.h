//
//  PlaylistsManager.h
//  GetYT
//
//  Created by iOS developer on 25/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Playlist;

@interface PlaylistsManager : NSObject
@property (nonatomic, strong, readonly) NSArray<Playlist *> *playlists;
@property (nonatomic, strong, readonly) Playlist *defaultPlaylist;
@property (nonatomic, strong, readonly) Playlist *currentPlaylist;

+ (PlaylistsManager *)sharedInstance;
- (Playlist *)addPlaylistWithTitle:(NSString *)title;
- (void)deletePlaylist:(Playlist *)playlist;

@end
