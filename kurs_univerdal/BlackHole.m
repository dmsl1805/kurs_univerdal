//
//  BlackHole.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/2/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "BlackHole.h"
#import "FlyweightTextureFactory.h"

@interface BlackHole ()

@end

@implementation BlackHole

+(instancetype)hole  {
    return [[self alloc] init];
}

- (BlackHole *)init {
    
    self = [super initWithTexture: [FlyweightTextureFactory getTexture:@"blackHoleTexture"]];
    if (self) {

        self.zPosition = 1;
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius: self.size.width / 2];
        self.physicsBody.allowsRotation = NO;
        //self.physicsBody.pinned = YES;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.dynamic = NO;
        self.physicsBody.categoryBitMask = 3;
        //self.holeMask = 3;
        self.physicsBody.contactTestBitMask = 1;
        self.name = @"hole";
        
    }
    return self;
}

- (void)performSuperGravityToSprite:( SKSpriteNode *)spriteNode
                        gravityBody:(SKPhysicsBody *)gravityBody
                                 do:(void (^)())doBlock
                         completion:(void (^)())block{
    if (gravityBody.categoryBitMask == self.physicsBody.categoryBitMask) {
        if ( doBlock ){
            doBlock();
        }
        
        SKPhysicsBody *oldBody = self.physicsBody;

        spriteNode.physicsBody = nil;
        self.physicsBody = nil;
        
        spriteNode.zPosition = 2;
        
        SKAction *rotate = [SKAction rotateByAngle:M_PI
                                          duration:1];
        SKAction *fade = [SKAction fadeOutWithDuration:3];
        SKAction *move = [SKAction moveTo:CGPointMake(self.position.x ,
                                                      self.position.y )
                                 duration:1];
        SKAction *scale = [SKAction scaleTo:0 duration:2];
        SKAction *group = [SKAction group:@[rotate, fade, move, scale]];
        [spriteNode runAction:group completion:^{
            if ( block ){
                self.physicsBody = oldBody;
                block();
            }
        }];
    } else if ( self.nextResponsibleHole ) {
        [self.nextResponsibleHole performSuperGravityToSprite:spriteNode gravityBody:gravityBody do:doBlock completion:block];
    }
}

@end
