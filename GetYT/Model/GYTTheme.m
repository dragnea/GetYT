//
//  GYTTheme.m
//  GetYT
//
//  Created by iOS developer on 28/09/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "GYTTheme.h"

@implementation GYTTheme

+ (UIColor *)colorRed {
    static UIColor *color = nil;
    if (!color) {
        color = [UIColor colorWithRed:227.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    }
    return color;
}

+ (UIColor *)colorWhiteNormal {
    static UIColor *color = nil;
    if (!color) {
        color = [UIColor colorWithWhite:1.0 alpha:0.7];
    }
    return color;
}

+ (UIColor *)colorWhiteDisabled {
    static UIColor *color = nil;
    if (!color) {
        color = [UIColor colorWithWhite:1.0 alpha:0.5];
    }
    return color;
}

+ (UIColor *)colorWhiteHighlighted {
    static UIColor *color = nil;
    if (!color) {
        color = [UIColor whiteColor];
    }
    return color;
}

@end
