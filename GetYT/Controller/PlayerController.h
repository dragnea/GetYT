//
//  PlayerController.h
//  GetYT
//
//  Created by Mihai Dragnea on 9/17/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, PCStatus) {
    PCStatus_play,
    PCStatus_pause,
    PCStatus_stop
};

typedef NS_OPTIONS(NSInteger, PCPlayMode) {
    PCPlayMode_once,
    PCPlayMode_normal,
    PCPlayMode_loopSong,
    PCPlayMode_loopList
};

@class Song;

@interface PlayerController : NSObject
@property (nonatomic, strong) Song *currentSong;
@property (nonatomic) PCStatus playStatus;
@property (nonatomic) PCPlayMode playMode;

+ (PlayerController *)sharedInstance;

@end
