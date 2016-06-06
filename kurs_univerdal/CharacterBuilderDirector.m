//
//  CharacterBuilderDirector.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/30/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "CharacterBuilderDirector.h"
#import "EaterBuilder.h"
#import "MonsterBuilder.h"

@implementation CharacterBuilderDirector

+ (CharacterBuilderDirector *)sharedDirector {
    static CharacterBuilderDirector *_sharedDirector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDirector = [[self alloc]init];
    });
    return _sharedDirector;
}

- (Eater *)buildEaterWithGameLevel:(GameLevel)gameLevel {
    EaterBuilder *eaterBuilder = [[[EaterBuilder alloc] init] initCharacter];
    switch (gameLevel) {
        case ChildLevel:
            [eaterBuilder buildCharacterSpeed:400];
            [eaterBuilder buildCharacterHealth:10000];
            break;
        case AdultLevel:
            [eaterBuilder buildCharacterSpeed:400];
            [eaterBuilder buildCharacterHealth:5000];
            break;
        case SuperHardLevel:
            [eaterBuilder buildCharacterSpeed:400];
            [eaterBuilder buildCharacterHealth:2000];
            break;
            
        default:
            break;
    }    return (Eater *)[eaterBuilder getCharacter];
}
- (Monster *)buildMonsterWithGameLevel:(GameLevel)gameLevel {
    MonsterBuilder *monsterBuilder = [[[MonsterBuilder alloc] init] initCharacter];
    switch (gameLevel) {
        case ChildLevel:
            [monsterBuilder buildCharacterSpeed:200];
            break;
        case AdultLevel:
            [monsterBuilder buildCharacterSpeed:300];
            break;
        case SuperHardLevel:
            [monsterBuilder buildCharacterSpeed:369];
            break;
            
        default:
            break;
    }
    return (Monster *)[monsterBuilder getCharacter];
}

@end
