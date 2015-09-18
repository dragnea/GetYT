//
//  PlayerVC.m
//  GetYT
//
//  Created by Mihai Dragnea on 9/16/15.
//  Copyright © 2015 Dragnea Mihai. All rights reserved.
//

#import "PlayerVC.h"
#import "PlayerController.h"

@interface PlayerVC ()<UITableViewDataSource, UITableViewDelegate, PlayerControllerDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *playPauseButton;
@property (nonatomic, weak) IBOutlet UIButton *stopButton;
@property (nonatomic, weak) IBOutlet UIButton *previousButton;
@property (nonatomic, weak) IBOutlet UIButton *nextButton;
@property (nonatomic, weak) IBOutlet UILabel *songTimer;
@property (nonatomic, weak) IBOutlet UISlider *songPosition;

@end

@implementation PlayerVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [PlayerController sharedInstance].delegate = self;
    self.tableView.contentInset = UIEdgeInsetsMake(140.0, 0.0, 0.0, 0.0);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (IBAction)playPauseButtonTouched:(id)sender {
    [[PlayerController sharedInstance] playOrPause];
}

- (IBAction)stopButtonTouched:(id)sender {
    [[PlayerController sharedInstance] stop];
}

- (IBAction)previousButtonTouched:(id)sender {
    [[PlayerController sharedInstance] previous];
}

- (IBAction)nextButtonTouched:(id)sender {
    [[PlayerController sharedInstance] next];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PlayerController sharedInstance].songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"...";
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [[PlayerController sharedInstance] moveSongFromIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - PlayerControllerDelegate

- (void)playerControllerStatusChanged:(PlayerController *)playerController {
    
}

- (void)playerController:(PlayerController *)playerController secondsPlayed:(int)secondsPlayed secondsDuration:(int)secondsDuration {
    div_t time = div(secondsPlayed, 60);
    int minutes = time.quot;
    int seconds = time.rem;
    self.songTimer.text = [NSString stringWithFormat:@"%.2d:%.2d", minutes, seconds];
    self.songPosition.maximumValue = secondsDuration;
    self.songPosition.value = secondsPlayed;
}

@end
