//
//  GameTypesFactory.h
//  kurs
//
//  Created by Dmitriy Shulzhenko on 5/21/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
@class GameScene;

typedef enum {
    TimeTrialMode,
    TapMode,
    FreeRunMode
} GameMode;

typedef enum {
    ChildLevel,
    AdultLevel,
    SuperHardLevel
} GameLevel;

@interface GameTypesFactory : NSObject

+ (GameScene *)createGameWorldFromMode:(GameMode)gameMode
                              gameLevel:(GameLevel)gameLevel;

@end
