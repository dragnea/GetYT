//
//  PlaylistsController.h
//  GetYT
//
//  Created by iOS developer on 25/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Playlist, Song;

@interface PlaylistsController : NSObject
@property (nonatomic, strong, readonly) Playlist *playlist;

- (instancetype)initWithPlaylist:(Playlist *)playList;
- (void)addURL:(NSString *)stringURL;
- (void)deleteSong:(Song *)song;

@end
