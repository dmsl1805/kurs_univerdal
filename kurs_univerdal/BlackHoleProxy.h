//
//  BlackHoleProxy.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/6/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "BlackHole.h"


@interface BlackHoleProxy : NSObject

@property ( nonatomic , strong, readonly ) BlackHole *hole;

- (void)performSuperGravityToSprite:( SKSpriteNode *)spriteNode
                        gravityBody:(SKPhysicsBody *)gravityBody
                                 do:(void (^)())doBlock
                         completion:(void (^)())block;

- (void)setNextResponsibleHole:(BlackHole *)nextResponsibleHole;

- (void)setCategoryBitMask:(NSInteger)categoryBitMask;

- (void)setPosition:(CGPoint)position;

@end
