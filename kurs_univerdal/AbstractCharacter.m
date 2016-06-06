//
//  AbstractCharacter.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/29/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "AbstractCharacter.h"
#import "LinearMove.h"
@interface AbstractCharacter()

@property ( nonatomic, readwrite ) BOOL isMoving;

@property ( nonatomic , strong ) NSMutableArray <SKTexture *> *characterMoveTextures;
@property ( nonatomic , strong ) SKTexture *characterInitTexture;
@property ( nonatomic , strong ) SKTextureAtlas *characterTextureAtlas;

@end

@implementation AbstractCharacter

+ (AbstractCharacter *)character {
    return nil;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    AbstractCharacter *copy = [[self class] character];
    copy.characterInitTexture = self.characterInitTexture;
    copy.characterMoveTextures = self.characterMoveTextures;
    copy.characterTextureAtlas = self.characterTextureAtlas;
    copy.name = self.name;
    copy.isMoving = self.isMoving;
    copy.characterSpeed =  self.characterSpeed;
    return copy;
}

- (void)moveToPoint:(CGPoint)point{
    if ( !self.isDead && [self shouldMove:self.position touchPosition:point]  ){
        if (self.characterMoving) {
        } else {
            self.characterMoving = [[LinearMove alloc] init];
        }
        
        self.isMoving = YES;
        self.physicsBody.pinned = NO;

        [self.characterMoving moveCharacter: self
                                    toPoint: point
                               withTextures: self.characterMoveTextures];
        
    }
}

- (void)stopMoving {
    self.physicsBody.resting = YES;
    self.physicsBody.pinned = NO;
    [self removeActionForKey:@"moveAction"];
    self.isMoving = NO;
    if (self.characterMoving) {
    } else {
        self.characterMoving = [[LinearMove alloc] init];
    }
    [self.characterMoving stopCharacter];
}

- (BOOL)shouldMove:(CGPoint)currentPosition
     touchPosition:(CGPoint)touchPosition {
    
    CGFloat absPozitionX = fabs( currentPosition.x - touchPosition.x );
    CGFloat absPozitionY = fabs( currentPosition.y - touchPosition.y );
    BOOL moreThanPlayerWidth = absPozitionX > self.frame.size.width / 2;
    BOOL moreThanPlayerHeight = absPozitionY > self.frame.size.height / 2;
    
    return (moreThanPlayerWidth || moreThanPlayerHeight);
}

@end
