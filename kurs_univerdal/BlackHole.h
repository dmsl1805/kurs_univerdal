//
//  BlackHole.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/2/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BlackHole : SKSpriteNode

@property ( nonatomic , weak ) BlackHole *nextResponsibleHole;

+ (instancetype)hole;

- (void)performSuperGravityToSprite:( SKSpriteNode *)spriteNode
                        gravityBody:(SKPhysicsBody *)gravityBody
                                 do:(void (^)())doBlock
                         completion:(void (^)())block;


@end
