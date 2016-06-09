//
//  SceneViewController.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/3/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "SceneViewController.h"
#import "GameScene.h"
#import "CharacterStateCareTaker.h"

#import <SpriteKit/SpriteKit.h>

@interface SceneViewController ()

@property (nonatomic, strong) UIView *pauseView;
@property (strong, nonatomic) IBOutlet UIView *pauseViewBackGround;
@property (nonatomic, strong) GameScene *scene;
@property (nonatomic, strong) NSMutableArray <CharacterStateCareTaker *> *charactersCaretakers;

@end

@implementation SceneViewController
- (void)viewDidLoad {
    self.charactersCaretakers  = [@[]mutableCopy];
    self.pauseView.frame = CGRectMake(0,
                                      0,
                                      self.view.frame.size.width,
                                      self.view.self.frame.size.height);
    self.pauseView.alpha = 0;
    [self.view addSubview: self.pauseView];
    
    
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.ignoresSiblingOrder = YES;
    
    self.scene = [GameTypesFactory createGameWorldFromMode: self.gameMode
                                                 gameLevel: self.gameLevel];
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [skView presentScene:self.scene];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIView *)pauseView{
    if ( !_pauseView ){
        _pauseView = [[[NSBundle mainBundle] loadNibNamed:@"PauseView" owner:self options:nil] lastObject];
    }
    return  _pauseView;
}

- (IBAction)pauseButtonPressed:(UIButton *)sender {
    if ( self.pauseView.alpha ) {
        [self restoreSceneStat];
    } else {
        [self saveSceneState];
    }
    [self.scene pauseGame: !self.pauseView.alpha];
    [UIView animateWithDuration:0.5 animations:^{
        self.pauseView.alpha = !self.pauseView.alpha ;
    }];
}

- (void)saveSceneState {
    [self.scene.monsterIterator enumerateMonstersUsingBlock:^(Monster *monster) {
        if ( ! monster.isDead ) {
            CharacterStateCareTaker *caretaker = [[CharacterStateCareTaker alloc]init];
            [caretaker setPosition: monster.position];
            [caretaker setVelocity: monster.physicsBody.velocity];
            [caretaker setRotation: monster.zRotation];
            [caretaker saveState];
            [self.charactersCaretakers addObject: caretaker];
        }
    }];
}
- (void)restoreSceneState {
    __block int i = 0;
    [self.scene.monsterIterator enumerateMonstersUsingBlock:^(Monster *monster) {
        if ( ! monster.isDead ) {
            CharacterStateCareTaker *caretaker = self.charactersCaretakers[i++];
            //[caretaker loadState];
            monster.position = caretaker.position;
            monster.zRotation = caretaker.rotation;
            monster.physicsBody.velocity = caretaker.velocity;
        }
    }];
}

- (void)restoreSceneStat{
}

- (IBAction)playButtonPressed:(UIButton *)sender {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self pauseButtonPressed:sender];
}
- (IBAction)settingsButtonPressd:(id)sender {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}
- (IBAction)homeButtonPressed:(id)sender {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end
