//
//  GameScene.m
//  fear_the_dead_objective_c
//
//  Created by Dmitriy Shulzhenko on 5/28/16.
//  Copyright (c) 2016 3. All rights reserved.
//

#import "GameScene.h"
#import "CharacterCommand.h"
#import "CharacterCommandExecutor.h"
#import "BlackHoleProxy.h"
#import "LinearMove.h"

@interface GameScene() <SKPhysicsContactDelegate>
@property ( nonatomic ) CGPoint lastTouch;
@property ( nonatomic ) BOOL contentCreated;
@property ( nonatomic, strong ) NSMutableArray <BlackHoleProxy *> *blackHoles;
@property ( nonatomic, strong ) CharacterCommandExecutor *eaterExecutor;
@property ( nonatomic, strong ) UIView *eaterHealhView;
@property ( nonatomic, strong ) id <CharacterMoving> characterMoving;
@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    if ( !self.contentCreated ){
        self.contentCreated = YES;
        self.physicsWorld.contactDelegate = self;
        
        if ( self.eater ) {
            [self addChild: self.eater];
        }
        __block int i = 0;
        if ( [self.monsterIterator firstObject] ) {
            [self.monsterIterator enumerateMonstersUsingBlock:^(Monster *monster) {
                [self addChild: monster];
                if ( !self.blackHoles ){
                    self.blackHoles = [@[]mutableCopy];
                }
                BlackHoleProxy *hole = [[BlackHoleProxy alloc] init];
                if ( i > 0){
                    [self.blackHoles[i-1] setNextResponsibleHole: hole.hole];
                }
                hole.categoryBitMask = 1024 * (i + 1) ;
                
                monster.physicsBody.categoryBitMask =  3 + i;
                i++;
                [self.blackHoles addObject:hole];
                [self addChild: hole.hole];
                
                hole.position =  CGPointMake([self getRandomNumberBetween:6000], [self getRandomNumberBetween:4000]);
                [monster setPosition:CGPointMake([self getRandomNumberBetween:4000], [self getRandomNumberBetween:2000])];
                
                SKSpriteNode *heart = [SKSpriteNode spriteNodeWithImageNamed:@"heart_anatomy"];
                heart.size = CGSizeMake(150, 150);
                heart.zRotation = 2 * M_PI;
                [self addChild: heart];
                heart.position =  CGPointMake([self getRandomNumberBetween:6000], [self getRandomNumberBetween:4000]);
            }];
        }
        
        
        SKSpriteNode *pause = [SKSpriteNode spriteNodeWithImageNamed: @"pause"];
        pause.position = CGPointMake(20, self.view.frame.size.height - 20);
        pause.name = @"pause";
        [self addChild: pause];
        
        self.camera.xScale = 0.6;
        self.camera.yScale = 0.6;
        
        [self updateCamera];
        self.eaterExecutor = [[CharacterCommandExecutor alloc]init];
        
        [self.eaterExecutor addCommand:[[CharacterCommand alloc]initWithCharacter:self.eater]];
        
        self.eater.characterMoving = [self characterMoving];
        
    }
    
}

- (id<CharacterMoving>)characterMoving {
    if( !_characterMoving ){
        _characterMoving = [[LinearMove alloc] init];
    }
    return _characterMoving;
}

-(int)getRandomNumberBetween:(int)to {
    
    return 100 + arc4random() % (to-101);
}
- (void)dealloc {
    
}
#pragma mark Touch Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lastTouch = [[touches anyObject] locationInNode: self];
    [self.eaterExecutor executeCommandForPoint: self.lastTouch];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lastTouch = [[touches anyObject] locationInNode: self];
    [self.eaterExecutor executeCommandForPoint: self.lastTouch];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lastTouch = [[touches anyObject] locationInNode: self];
    [self.eater stopMoving];
}

- (void)pauseButtonPressed:(UIButton*)sender {
    
}
#pragma mark Updates

- (void)didSimulatePhysics {
    [self updateCamera];
    [self updateMonsters];
}

- (void)updateCamera {
    self.camera.position = self.eater.position;
}
- (void)updateMonsters {
    [self.monsterIterator enumerateMonstersUsingBlock:^(Monster *monster) {
        [monster moveToPoint: self.eater.position];
    }];
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

#pragma mark SKPhysicsContactDelegate

- (void)didBeginContact:(SKPhysicsContact *)contact {
    __block SKPhysicsBody *monsterBody;
    __block Monster *monstere;
    __block SKPhysicsBody *eaterBody;
    __block SKPhysicsBody *holeBody;
    
    [self.monsterIterator enumerateMonstersUsingBlock:^(Monster *monster) {
        if ( monster.physicsBody.categoryBitMask == contact.bodyA.categoryBitMask ) {
            monsterBody = contact.bodyA;
            monstere = monster;
        } else if ( monster.physicsBody.categoryBitMask == contact.bodyB.categoryBitMask ){
            monstere = monster;
            monsterBody = contact.bodyB;
        }
    }];
    
    for (BlackHoleProxy *hole in self.blackHoles) {
        if ( hole.hole.physicsBody.categoryBitMask == contact.bodyA.categoryBitMask ) {
            holeBody = contact.bodyA;
        } else if ( hole.hole.physicsBody.categoryBitMask == contact.bodyB.categoryBitMask ){
            holeBody = contact.bodyB;
        }
    }
    if ( self.eater.physicsBody.categoryBitMask == contact.bodyA.categoryBitMask ){
        eaterBody = contact.bodyA;
    } else if ( self.eater.physicsBody.categoryBitMask == contact.bodyA.categoryBitMask ) {
        eaterBody = contact.bodyB;
    }
    
    if ( monsterBody && holeBody) {
        NSLog(@"hole && monster");
        
        [self.blackHoles.firstObject performSuperGravityToSprite:monstere
                                                     gravityBody:holeBody
                                                              do:^{
                                                                  monstere.isDead = YES;
                                                                  [monstere stopMoving];
                                                              } completion:^{
                                                                  [monstere removeFromParent];
                                                              }];
    } else if ( monsterBody && eaterBody ) {
        NSLog(@"monster && eater");
        [UIView animateWithDuration:0.2 animations:^{
            CGRect r = self.eaterHealhView.frame;
            self.eaterHealhView.frame = CGRectMake(r.origin.x, r.origin.y, r.size.width - 10, r.size.height);
        }];
    } else if ( eaterBody && holeBody ) {
        NSLog(@"hole && eater");
        
        [self.blackHoles.firstObject performSuperGravityToSprite:self.eater
                                                     gravityBody:holeBody
                                                              do:^{
                                                                  self.eater.isDead = YES;
                                                                  [self.eater stopMoving];
                                                                  [self.eater removeAllActions];
                                                                  self.eater.health = 0;
                                                                  [UIView animateWithDuration:1 animations:^{
                                                                      CGRect r = self.eaterHealhView.frame;
                                                                      self.eaterHealhView.frame = CGRectMake(r.origin.x,
                                                                                                             r.origin.y,
                                                                                                             0,
                                                                                                             r.size.height);
                                                                  }];
                                                              } completion:^{
                                                                  [self.eater removeFromParent];
                                                              }];
    }
    
}



- (void)gameOver:(BOOL)didWin {
    if ( didWin ) {
        NSLog(@"___WIN____");
        
    } else {
        NSLog(@"___LOSE____");
        
    }
}

@end

