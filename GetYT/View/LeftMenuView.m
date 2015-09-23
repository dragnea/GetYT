//
//  LeftMenuView.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/22/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "LeftMenuView.h"
#import "MenuButton.h"

static NSInteger menuWidth = 220;
static NSInteger menuButtonMargin = 4;

@interface LeftMenuView ()<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *screenEdgePanGesture;
@property (nonatomic, strong, readonly) UITapGestureRecognizer *dismissGesture;
@property (nonatomic, strong, readonly) UITableView *sliderTableView;
@property (nonatomic, strong, readonly) UIView *backgroundView;
@property (nonatomic, strong, readonly) UIView *baseView;
@property (nonatomic, strong, readonly) MenuButton *menuButton;
@end

@implementation LeftMenuView

- (id)initWithView:(UIView *)view {
    if (self = [super initWithFrame:view.bounds]) {
        
        _baseView = view;
        
        _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _backgroundView.alpha = 0.0;
        [self addSubview:_backgroundView];
        _backgroundView.userInteractionEnabled = YES;
        
        _sliderTableView = [[UITableView alloc] initWithFrame:CGRectMake(-menuWidth, 0.0, menuWidth, view.bounds.size.height) style:UITableViewStyleGrouped];
        _sliderTableView.dataSource = self;
        _sliderTableView.delegate = self;
        [self addSubview:_sliderTableView];
        
        _screenEdgePanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
        _screenEdgePanGesture.delegate = self;
        _screenEdgePanGesture.minimumNumberOfTouches = 1;
        _screenEdgePanGesture.maximumNumberOfTouches = 1;
        [view addGestureRecognizer:_screenEdgePanGesture];
        
        _dismissGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissGesture:)];
        _dismissGesture.numberOfTapsRequired = 1;
        _dismissGesture.numberOfTouchesRequired = 1;
        [_backgroundView addGestureRecognizer:_dismissGesture];
        
        [view addSubview:self];
        
        _menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(4.0, 24.0, 40.0, 40.0)];
        [_menuButton addTarget:self action:@selector(menuButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_menuButton];
        
    }
    return self;
}

- (void)menuMakeVisible:(BOOL)visible {
    _menuVisible = visible;
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         CGRect sliderFrame = self.sliderTableView.frame;
                         sliderFrame.origin.x = !_menuVisible ? -menuWidth : 0.0;
                         self.sliderTableView.frame = sliderFrame;
                         self.backgroundView.alpha = _menuVisible;
                         
                         CGRect menuButtonFrame = self.menuButton.frame;
                         menuButtonFrame.origin.x = !_menuVisible ? menuButtonMargin : menuWidth - menuButtonFrame.size.width - menuButtonMargin;
                         self.menuButton.frame = menuButtonFrame;
                         self.menuButton.animationFrameValue = _menuVisible;
                         
                     } completion:^(BOOL finished) {
                         
                         
                         
                     }];
}

- (void)menuButtonTouched:(MenuButton *)menuButton {
    [self menuMakeVisible:!_menuVisible];
}

- (void)panned:(UIPanGestureRecognizer *)panGesture {
    
    CGPoint translationPoint = [panGesture translationInView:self.superview];
    CGPoint velocityPoint = [panGesture velocityInView:self.superview];
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        
        
        
    }
    
    if (panGesture.state == UIGestureRecognizerStateChanged &&
               translationPoint.x > 0 &&
               translationPoint.x < menuWidth) {
        
        CGRect sliderFrame = self.sliderTableView.frame;
        sliderFrame.origin.x = translationPoint.x - menuWidth;
        self.sliderTableView.frame = sliderFrame;
        self.backgroundView.alpha = (sliderFrame.origin.x + menuWidth) / menuWidth;
        
        CGRect menuButtonFrame = self.menuButton.frame;
        CGFloat menuButtonTranslation = translationPoint.x - menuButtonFrame.size.width - menuButtonMargin;
        if (menuButtonTranslation < menuButtonMargin) {
            menuButtonFrame.origin.x = menuButtonMargin;
        } else if (menuButtonTranslation > menuWidth) {
            menuButtonFrame.origin.x = menuWidth - menuButtonFrame.size.width - menuButtonMargin;
        } else {
            menuButtonFrame.origin.x = menuButtonTranslation;
        }
        self.menuButton.frame = menuButtonFrame;
        self.menuButton.animationFrameValue = translationPoint.x / menuWidth;
        
    }
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        
        if (ABS(velocityPoint.x) > 800) {
            
            [self menuMakeVisible:velocityPoint.x > 0];
            
        } else if (!_menuVisible) {
            
            [self menuMakeVisible:translationPoint.x > menuWidth / 4];
            
        } else {
            
            [self menuMakeVisible:translationPoint.x > menuWidth / 1.25];
            
        }
        
    }
    
}

- (void)dismissGesture:(UITapGestureRecognizer *)tapGesture {
    [self menuMakeVisible:NO];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // disable self interaction but keep separated interactions for other subviews
    id view = [super hitTest:point withEvent:event];
    if (view != self) {
        return _menuVisible ? view : self.menuButton;
    } else {
        return nil;
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.screenEdgePanGesture) {
        return !_menuVisible;
    } else {
        return YES;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
