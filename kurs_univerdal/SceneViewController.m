//
//  SceneViewController.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/3/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "SceneViewController.h"
#import "GameScene.h"
#import <SpriteKit/SpriteKit.h>

@implementation SceneViewController
- (void)viewDidLoad {
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    GameScene *scene = [GameTypesFactory createGameWorldFromMode:self.gameMode
                                                       gameLevel:self.gameLevel];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
