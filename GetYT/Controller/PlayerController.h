//
//  PlayerController.h
//  GetYT
//
//  Created by Mihai Dragnea on 9/17/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, PlayerStatus) {
    PlayerStatus_play,
    PlayerStatus_pause,
    PlayerStatus_stop
};

typedef NS_OPTIONS(NSInteger, PlayerPlayMode) {
    PlayerPlayMode_normal,
    PlayerPlayMode_loopList,
    PlayerPlayMode_loopSong
};

@class Song;

@protocol PlayerControllerDelegate;

@interface PlayerController : NSObject

@property (nonatomic, strong, readonly) NSArray *songs;
@property (nonatomic, strong, readonly) Song *playingSong;
@property (nonatomic, readonly) PlayerStatus playStatus;
@property (nonatomic) PlayerPlayMode playMode;
@property (nonatomic, weak) id <PlayerControllerDelegate>delegate;

+ (PlayerController *)sharedInstance;
- (void)next;
- (void)previous;
- (void)playOrPause;
- (void)stop;
- (void)playSong:(Song *)song;

@end

@protocol PlayerControllerDelegate <NSObject>

- (void)playerControllerStatusChanged:(PlayerController *)playerController;

@end
