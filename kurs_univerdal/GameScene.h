//
//  GameScene.h
//  fear_the_dead_objective_c
//

//  Copyright (c) 2016 3. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "AbstractCharacter.h"
#import "Eater.h"
#import "Monster.h"
#import "MonstersIterator.h"
#import "CharacterMoving.h"

@interface GameScene : SKScene

@property ( nonatomic, strong ) AbstractCharacter *eater;
@property ( nonatomic, strong ) MonstersIterator *monsterIterator;
@end
