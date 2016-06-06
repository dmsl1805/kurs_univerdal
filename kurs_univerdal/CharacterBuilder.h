//
//  CharacterBuilder.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/30/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class AbstractCharacter;

@interface CharacterBuilder : NSObject

- (CharacterBuilder *)initCharacter;
- (CharacterBuilder *)buildCharacterSpeed:(CGFloat)speed;
- (CharacterBuilder *)buildCharacterAgressive:(CGFloat)agressive;
- (CharacterBuilder *)buildCharacterPower:(CGFloat)power;
- (CharacterBuilder *)buildCharacterAgility:(CGFloat)agility;
- (CharacterBuilder *)buildCharacterIntelligence:(CGFloat)intelligence;
- (CharacterBuilder *)buildCharacterShield:(CGFloat)shield;
- (CharacterBuilder *)buildCharacterHealth:(CGFloat)health;
- (AbstractCharacter *)getCharacter;

@end
