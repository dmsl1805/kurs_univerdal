//
//  GameViewController.m
//  fear_the_dead_objective_c
//
//  Created by Dmitriy Shulzhenko on 5/28/16.
//  Copyright (c) 2016 3. All rights reserved.
//

#import "GameViewController.h"
#import "SceneViewController.h"

@interface GameViewController()
@property (strong, nonatomic) IBOutlet UIButton *timeTrial;
@property (strong, nonatomic) IBOutlet UIButton *freeRun;
@property (strong, nonatomic) IBOutlet UIButton *tap;

@property (nonatomic) BOOL isAnimated;

@end


@implementation GameViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GameMode gameMode;
    UIButton *buttonToAnimate;
    
    if ( [segue.identifier isEqualToString: @"tapper"] ) {
        gameMode = TapMode;
        buttonToAnimate = self.tap;
    } else if ( [segue.identifier isEqualToString:@"freeRun"] ) {
        gameMode = FreeRunMode;
        buttonToAnimate = self.freeRun;
    } else if ( [segue.identifier isEqualToString:@"timeTrial"] ) {
        gameMode = TimeTrialMode;
        buttonToAnimate = self.timeTrial;
    }
    
    if ( [segue.destinationViewController isKindOfClass: [SceneViewController class] ] ) {
        SceneViewController *vc = (SceneViewController *)segue.destinationViewController;
        vc.gameMode = gameMode;
        vc.gameLevel = self.gameLevel;
    }
}

@end
