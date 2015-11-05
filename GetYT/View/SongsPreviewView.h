//
//  SongsPreviewView.h
//  GetYT
//
//  Created by Mihai Dragnea on 11/5/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SongsPreviewView;

typedef NS_OPTIONS(NSInteger, SongsPreviewPosition) {
    SongsPreviewPosition_previous,
    SongsPreviewPosition_current,
    SongsPreviewPosition_next,
    SongsPreviewPosition_beforePrevious,
    SongsPreviewPosition_afterNext
};

@protocol SongsPreviewViewDataSource <NSObject>

- (NSString *)songsPreviewView:(SongsPreviewView *)songsPreviewView position:(SongsPreviewPosition)position;

@end

@interface SongsPreviewView : UIView

@property (nonatomic, weak) id<SongsPreviewViewDataSource>dataSource;
@property (nonatomic) BOOL fullscreen;

- (void)moveToPreviousSong;
- (void)moveToNextSong;

@end
