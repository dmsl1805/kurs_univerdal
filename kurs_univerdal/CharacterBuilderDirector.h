//
//  CharacterBuilderDirector.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/30/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Eater.h"
#import "Monster.h"
#import "GameTypesFactory.h"

@interface CharacterBuilderDirector : NSObject

+ (CharacterBuilderDirector *)sharedDirector;
- (Eater *)buildEaterWithGameLevel:(GameLevel)gameLevel;
- (Monster *)buildMonsterWithGameLevel:(GameLevel)gameLevel;

@end
