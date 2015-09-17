//
//  PlayerController.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/17/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayerController.h"
#import <AVFoundation/AVFoundation.h>

@interface PlayerController ()
@property (nonatomic, strong, readonly) AVQueuePlayer *queuePlayer;
@end

@implementation PlayerController
@synthesize queuePlayer = _queuePlayer;

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
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(audioSessionInterrupted:)
                                                     name:AVAudioSessionInterruptionNotification
                                                   object:[AVAudioSession sharedInstance]];
        
        NSError *categoryError=  nil;
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&categoryError];
        
        if (categoryError) {
            NSLog(@"Error setting category! %@", [categoryError description]);
        }
        
        //activation of audio session
        NSError *activationError = nil;
        if (![[AVAudioSession sharedInstance] setActive:YES error:&activationError]) {
            if (activationError) {
                NSLog(@"Could not activate audio session. %@", activationError.localizedDescription);
            } else {
                NSLog(@"audio session could not be activated!");
            }
        }
        
    }
    return self;
}

- (AVQueuePlayer *)queuePlayer {
    if (!_queuePlayer) {
        _queuePlayer = [[AVQueuePlayer alloc] init];
        _queuePlayer.actionAtItemEnd = AVPlayerActionAtItemEndAdvance;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:_queuePlayer.currentItem];
    }
    return _queuePlayer;
}

- (void)next {
    
}

- (void)previous {
    
}

- (void)playOrPause {
    if (_playStatus == PlayerStatus_pause) {
        
        [self.queuePlayer play];
        _playStatus = PlayerStatus_play;
        
    } else if (_playStatus == PlayerStatus_play) {
        
        [self.queuePlayer pause];
        _playStatus = PlayerStatus_pause;
        
    } else {
        
        // the player is stopped
        
    }
    
    [self.delegate playerControllerStatusChanged:self];
}

- (void)playSong:(Song *)song {
    _playStatus = PlayerStatus_play;
    _playingSong = song;
    [self.delegate playerControllerStatusChanged:self];
}

- (void)stop {
    _playStatus = PlayerStatus_stop;
    _playingSong = nil;
    [self.delegate playerControllerStatusChanged:self];
}

- (void)setPlayMode:(PlayerPlayMode)playMode {
    _playMode = playMode;
}

#pragma mark - AVAudioSessionInterruption

- (void)audioSessionInterrupted:(NSNotification *)notification {
    
}

#pragma mark - AVQueuePlayer

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    
}

@end
