//
//  PlayerVC.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/16/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayerVC.h"
#import "PlayerController.h"
#import "PlaylistsController.h"
#import "PlaylistsManager.h"
#import "Playlist.h"
#import "Song.h"
#import "PlayerView.h"

@interface PlayerVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong, readonly) PlayerView *playerView;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, weak) PlaylistsController *playlistsController;
@end

@implementation PlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(180.0, 0.0, 0.0, 0.0);
    _playerView = [[PlayerView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 180.0)];
    [self.view addSubview:_playerView];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PlaylistsManager sharedInstance].currentPlaylist.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [PlaylistsManager sharedInstance].currentPlaylist.songs.allObjects[indexPath.row].title;
    cell.detailTextLabel.text = @"---";
    return cell;
}

#pragma mark - PlayerControllerDelegate

- (void)playerController:(PlayerController *)playerController secondsPlayed:(int)secondsPlayed secondsDuration:(int)secondsDuration {
    div_t time = div(secondsPlayed, 60);
    int minutes = time.quot;
    int seconds = time.rem;
    
}

@end
