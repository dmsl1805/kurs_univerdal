//
//  LinearMove.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/2/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "LinearMove.h"
#import "AbstractCharacter.h"

@interface LinearMove ()

@property ( nonatomic, readwrite ) BOOL isAnimating;

@end

@implementation LinearMove

- (void)moveCharacter:(AbstractCharacter *)character toPoint:(CGPoint)point withTextures:(NSArray *)textures {
    
    CGFloat angle = atan2(character.position.y - point.y, character.position.x - point.x) + M_PI;
    
    character.zRotation = angle;
    CGFloat velocityX = character.characterSpeed * cos(angle);
    CGFloat velocityY = character.characterSpeed * sin(angle);
    CGVector newVelocity = CGVectorMake(velocityX, velocityY);
    character.physicsBody.velocity = newVelocity;
    
    if ( !self.isAnimating ) {
        self.isAnimating = YES;
        SKAction *moveAction = [SKAction animateWithTextures: textures
                                                timePerFrame:0.1];
        SKAction *moveForever = [SKAction repeatActionForever: moveAction];
        [character runAction: moveForever withKey:@"moveAction"];
    }
}

- (void)stopCharacter {
    self.isAnimating = NO;
}
@end
