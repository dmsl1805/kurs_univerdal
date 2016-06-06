//
//  AbstractCharacter.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/29/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "CharacterMoving.h"

@interface AbstractCharacter : SKSpriteNode <NSCopying>

@property ( nonatomic ) CGFloat characterSpeed;
@property ( nonatomic ) CGFloat agressive;
@property ( nonatomic ) CGFloat power;
@property ( nonatomic ) CGFloat agility;
@property ( nonatomic ) CGFloat intelligence;
@property ( nonatomic ) CGFloat shield;
@property ( nonatomic ) CGFloat health;
@property ( nonatomic ) BOOL isDead;

@property ( nonatomic, readonly ) BOOL isMoving;

@property ( nonatomic, strong ) id <CharacterMoving> characterMoving;

+ (AbstractCharacter *)character;
- (void)moveToPoint:(CGPoint)point;
- (void)stopMoving;

-(id) copyWithZone: (NSZone *) zone;

@end
