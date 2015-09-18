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

@interface PlayerController ()
@property (nonatomic, strong, readonly) AVPlayer *player;
@end

@implementation PlayerController
@synthesize player = _player;

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
        
        NSError *categoryError = nil;
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&categoryError];
        
        if (!categoryError) {
            NSLog(@"AVAudioSessionCategoryPlayback active");
        } else {
            NSLog(@"Error setting category! %@", [categoryError description]);
        }
        
        //activation of audio session
        NSError *activationError = nil;
        if (![[AVAudioSession sharedInstance] setActive:YES error:&activationError]) {
            if (activationError) {
                NSLog(@"Could not activate audio session. %@", activationError.localizedDescription);
            } else {
                NSLog(@"Audio session could not be activated!");
            }
        } else {
            NSLog(@"Audio session activated");
        }
        
        NSURL *songURL = [[NSBundle mainBundle] URLForResource:@"Imany vs Filatov & Karas - Don't be so shy" withExtension:@"mp3"];
        NSURL *libraryPath = [[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask].lastObject;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(audioSessionInterrupted:)
                                                     name:AVAudioSessionInterruptionNotification
                                                   object:[AVAudioSession sharedInstance]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:_player.currentItem];
        
        [self reloadSongs];
        
    }
    return self;
}

- (void)dealloc {
    [self.player removeTimeObserver:self];
}

- (void)reloadSongs {
    NSSortDescriptor *songSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    _songs = [[CoreDataController sharedInstance] fetchModelClass:[Song class] withPredicate:nil sortDescriptors:@[songSortDescriptor]];
}

- (void)next {
    
}

- (void)previous {
    
}

- (AVPlayer *)player {
    if (!_player) {
        _player = [[AVPlayer alloc] init];
        CMTime periodicRefresh = CMTimeMakeWithSeconds(1.0f, 1);
        __unsafe_unretained typeof(self) _self = self;
        [_player addPeriodicTimeObserverForInterval:periodicRefresh queue:NULL usingBlock:^(CMTime time) {
            [_self.delegate playerController:_self secondsPlayed:CMTimeGetSeconds(time) secondsDuration:CMTimeGetSeconds(_self.player.currentItem.duration)];
        }];
    }
    return _player;
}

- (void)playOrPause {
    if (_playStatus == PlayerStatus_pause ||
        _playStatus == PlayerStatus_stop) {
        
        NSURL *songURL = [[NSBundle mainBundle] URLForResource:@"Imany vs Filatov & Karas - Don't be so shy" withExtension:@"mp3"];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:songURL];
        [self.player replaceCurrentItemWithPlayerItem:playerItem];
        [self.player play];
        _playStatus = PlayerStatus_play;
        
    } else if (_playStatus == PlayerStatus_play) {
        
        [self.player pause];
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

- (void)moveSongFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    Song *fromSong = self.songs[fromIndex];
    NSMutableArray *orderedSongs = [self.songs mutableCopy];
    [orderedSongs removeObject:fromSong];
    [orderedSongs insertObject:fromSong atIndex:toIndex];
    [self.songs enumerateObjectsUsingBlock:^(Song * _Nonnull enumSong, NSUInteger idx, BOOL * _Nonnull stop) {
        enumSong.index = @(idx);
    }];
    
}

- (void)removeSong:(Song *)song {
    
}

#pragma mark - AVAudioSessionInterruption

- (void)audioSessionInterrupted:(NSNotification *)notification {
    
}

#pragma mark - AVQueuePlayer

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    
}

@end
