//
//  GameTypesFactory.m
//  kurs
//
//  Created by Dmitriy Shulzhenko on 5/21/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "GameTypesFactory.h"
#import "CharacterBuilderDirector.h"
#import "Monster.h"
#import "GameSceneTap.h"
#import "GameSceneTimer.h"

@implementation GameTypesFactory

+ (GameScene *)createGameWorldFromMode:(GameMode)gameMode
                              gameLevel:(GameLevel)gameLevel{
    
    GameScene *scene;
    
    switch (gameMode) {
        case FreeRunMode:
            scene = [GameScene nodeWithFileNamed:@"GameScene"];
            break;
            
        case TimeTrialMode:
            scene = [GameSceneTimer nodeWithFileNamed:@"GameScene"];
            break;
            
        case TapMode:
            scene = [GameSceneTap nodeWithFileNamed:@"GameScene"];
            break;
            
        default:
            break;
    }
    
    scene.eater = [[CharacterBuilderDirector sharedDirector] buildEaterWithGameLevel:gameLevel];
    MonstersIterator *iterator = [[MonstersIterator alloc]init];
    iterator.gameLevel = gameLevel;
    scene.monsterIterator = iterator;
    return scene;
}


@end
