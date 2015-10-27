//
//  PlayerController.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/17/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayerController.h"
#import "CoreDataController.h"
#import <AVFoundation/AVFoundation.h>
#import "Song.h"

static NSString *kPCPlayerMode = @"PCPlayerMode";

@interface PlayerController ()<AVAudioPlayerDelegate>
@property (nonatomic, strong, readonly) AVAudioPlayer *audioPlayer;
@end

@implementation PlayerController

+ (PlayerController *)sharedInstance {
    static PlayerController *staticInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticInstance = [[PlayerController alloc] init];
    });
    return staticInstance;
}

- (id)init {
    if (self = [super init]) {
        
        _audioPlayer = [[AVAudioPlayer alloc] init];
        
    }
    return self;
}

- (void)setPlayStatus:(PCStatus)playStatus {
    switch (playStatus) {
        case PCStatus_play:
            
            break;
        case PCStatus_pause:
            
            break;
        case PCStatus_stop:
            
            break;
            
        default:
            break;
    }
    _playStatus = playStatus;
}

- (void)setPlayMode:(PCPlayMode)playMode {
    [[NSUserDefaults standardUserDefaults] setInteger:playMode forKey:kPCPlayerMode];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (PCPlayMode)playMode {
    return [[NSUserDefaults standardUserDefaults] integerForKey:kPCPlayerMode];
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    
}

#pragma mark - AVAudioSessionInterruption

- (void)audioSessionInterrupted:(NSNotification *)notification {
    
}

@end
