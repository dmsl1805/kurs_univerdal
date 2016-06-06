//
//  MonsterBuilder.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/30/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "MonsterBuilder.h"
#import "Monster.h"
@interface CharacterBuilder()

@property (nonatomic, strong) AbstractCharacter *character;

@end

@implementation MonsterBuilder

- (MonsterBuilder *)initCharacter {
    self.character = [Monster character];
    return self;
}

@end
