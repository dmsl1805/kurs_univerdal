//
//  MonstersIterator.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/1/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "MonstersIterator.h"
#import "Monster.h"
#import "CharacterBuilderDirector.h"

@interface MonstersIterator ()
@property ( nonatomic, strong ) NSMutableArray <Monster *> *monsters;
@end

@implementation MonstersIterator

- (void)enumerateMonstersUsingBlock:(void (^)(Monster *monster))enumerator {
    if ( self.monsters ) {
        [self.monsters enumerateObjectsUsingBlock:^(Monster * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            enumerator(obj);
        }];
    } else {
        self.monsters = [@[] mutableCopy];
        Monster *monster = [[CharacterBuilderDirector sharedDirector] buildMonsterWithGameLevel:self.gameLevel];
        [self.monsters addObject: monster];
        if ( enumerator ) {
            enumerator(monster);
        }
        int i = 0;
        switch (self.gameLevel) {
            case ChildLevel:
                i = 5;
                break;
            case AdultLevel:
                i = 15;
                break;
            case SuperHardLevel:
                i = 30;
                break;
                
            default:
                break;
        }
        for (int j = 0; j < i; j++) {
            Monster *monsterNext = [monster copy];
            if ( enumerator ) {
                enumerator(monsterNext);
            }
            [self.monsters addObject: monsterNext];
        }
    }
}

- (Monster *)firstObject {
    if ( ! self.monsters ){
        [self enumerateMonstersUsingBlock:nil];
    }
    return self.monsters[0];
}

@end
