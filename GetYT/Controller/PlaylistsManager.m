//
//  PlaylistsManager.m
//  GetYT
//
//  Created by iOS developer on 25/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlaylistsManager.h"
#import "CoreDataController.h"
#import "Playlist.h"

@implementation PlaylistsManager

+ (PlaylistsManager *)sharedInstance {
    static PlaylistsManager *staticInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticInstance = [[PlaylistsManager alloc] init];
    });
    return staticInstance;
}

- (id)init {
    if (self = [super init]) {
        
        
        
    }
    return self;
}

- (NSArray<Playlist *> *)playlists {
    NSSortDescriptor *playlistTitleSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSArray<Playlist *> *playlists = [[CoreDataController sharedInstance] fetchModelClass:[Playlist class] withPredicate:nil sortDescriptors:@[playlistTitleSortDescriptor]];
    if (!playlists) {
        Playlist *defaultPlaylist = [Playlist newObject];
        defaultPlaylist.defaultPlaylist = @YES;
        defaultPlaylist.title = @"Default";
        playlists = @[defaultPlaylist];
    }
    return playlists;
}

- (Playlist *)defaultPlaylist {
    NSPredicate *defaultPlaylistPredicate = [NSPredicate predicateWithFormat:@"defaultPlaylist == YES"];
    return [self.playlists filteredArrayUsingPredicate:defaultPlaylistPredicate].firstObject;
}

- (Playlist *)currentPlaylist {
    return self.defaultPlaylist;
}

- (Playlist *)addPlaylistWithTitle:(NSString *)title {
    Playlist *newPlaylist = [Playlist newObject];
    newPlaylist.defaultPlaylist = @NO;
    newPlaylist.title = title;
    return newPlaylist;
}

- (void)deletePlaylist:(Playlist *)playlist {
    [playlist delegeteObject];
}

@end
