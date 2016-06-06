//
//  CharacterBuilder.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/30/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "CharacterBuilder.h"
#import "AbstractCharacter.h"

@interface CharacterBuilder ()

@property (nonatomic, strong) AbstractCharacter *character;

@end

@implementation CharacterBuilder

- (CharacterBuilder *)initCharacter {
    self.character = [AbstractCharacter character];
    return self;
}
- (CharacterBuilder *)buildCharacterSpeed:(CGFloat)speed{
    self.character.characterSpeed = speed;
    return self;
}
- (CharacterBuilder *)buildCharacterAgressive:(CGFloat)agressive{
    self.character.agressive = agressive;
    return self;
}
- (CharacterBuilder *)buildCharacterPower:(CGFloat)power{
    self.character.power = power;
    return self;
}
- (CharacterBuilder *)buildCharacterAgility:(CGFloat)agility{
    self.character.agility = agility;
    return self;
}
- (CharacterBuilder *)buildCharacterIntelligence:(CGFloat)intelligence{
    self.character.intelligence = intelligence;
    return self;
}
- (CharacterBuilder *)buildCharacterShield:(CGFloat)shield{
    self.character.shield = shield;
    return self;
}
- (CharacterBuilder *)buildCharacterHealth:(CGFloat)health{
    self.character.health = health;
    return self;
}
- (AbstractCharacter *)getCharacter {
    return self.character;
}
@end
