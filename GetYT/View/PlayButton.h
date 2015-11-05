//
//  PlayButton.h
//  GetYT
//
//  Created by iOS developer on 27/10/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayButton : UIControl
@property (nonatomic, strong) UIImage *image;
@property (nonatomic) BOOL paused;
@property (nonatomic) BOOL fullscreen;

@end
