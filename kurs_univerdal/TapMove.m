//
//  TapMove.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/3/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "TapMove.h"
#import "AbstractCharacter.h"

@interface TapMove ()

@property ( nonatomic, readwrite ) BOOL isAnimating;

@end

@implementation TapMove

- (void)moveCharacter:(AbstractCharacter *)character toPoint:(CGPoint)point withTextures:(NSArray *)textures {
   
    CGFloat angle = atan2(character.position.y - point.y, character.position.x - point.x) + M_PI;
    
    character.zRotation = angle;
    CGFloat velocityX = character.characterSpeed * cos(angle);
    CGFloat velocityY = character.characterSpeed * sin(angle);
    CGVector newVelocity = CGVectorMake(velocityX / 3, velocityY / 3);

    SKAction *moveAction = [SKAction moveBy:newVelocity duration:0.5];
    SKAction *moveActionAnimation = [SKAction animateWithTextures: textures
                                                     timePerFrame:0.1];
    SKAction *moveForever = [SKAction repeatActionForever: moveActionAnimation];
    
    if ( !self.isAnimating ){
        [character runAction:moveForever];
        self.isAnimating = YES;
    }
    [character runAction:moveAction completion:^{
        [character removeAllActions];
        self.isAnimating = NO;
    }];
}

- (void)stopCharacter {
}

@end
