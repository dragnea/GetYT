//
//  Song.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/16/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "Song.h"

@implementation Song

- (BOOL)fileExists {
    return !(!self.url || self.url.length == 0 || ![[NSFileManager defaultManager] fileExistsAtPath:self.url]);
}

@end
