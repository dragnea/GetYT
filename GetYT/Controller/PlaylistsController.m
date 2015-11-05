//
//  PlaylistsController.m
//  GetYT
//
//  Created by iOS developer on 25/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlaylistsController.h"
#import "PlayerController.h"
#import "CoreDataController.h"
#import "Playlist.h"
#import "Song.h"

@implementation PlaylistsController

- (id)initWithPlaylist:(Playlist *)playList {
    if (self = [super init]) {
        _playlist = playList;
    }
    return self;
}

- (void)addURL:(NSString *)stringURL {
    Song *newSong = [Song newObject];
    newSong.playlist = self.playlist;
    newSong.url = stringURL;
    newSong.dateAdded = [NSDate date];
    newSong.index = @(self.playlist.songs.count);
}

- (void)deleteSong:(Song *)song {
    [song delegeteObject];
}

@end
