//
//  BlackHoleProxy.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/6/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "BlackHoleProxy.h"

@interface BlackHoleProxy ()

@property ( nonatomic , strong, readwrite ) BlackHole *hole;

@end

@implementation BlackHoleProxy

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hole = [BlackHole hole];
    }
    return self;
}
- (void)performSuperGravityToSprite:( SKSpriteNode *)spriteNode
                        gravityBody:(SKPhysicsBody *)gravityBody
                                 do:(void (^)())doBlock
                         completion:(void (^)())block {
    
    [self.hole performSuperGravityToSprite:spriteNode
                               gravityBody:gravityBody
                                        do:doBlock
                                completion:block];
}

- (void)setNextResponsibleHole:(BlackHole *)nextResponsibleHole {
    self.hole.nextResponsibleHole = nextResponsibleHole;
}

- (void)setCategoryBitMask:(NSInteger)categoryBitMask{
    self.hole.physicsBody.categoryBitMask = categoryBitMask;
}

- (void)setPosition:(CGPoint)position {
    self.hole.position = position;
}
@end
