//
//  Eater.m
//  kurs
//
//  Created by Dmitriy Shulzhenko on 5/22/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "Eater.h"
#import "NSString+png.h"

@interface AbstractCharacter()

@property ( nonatomic, readwrite ) BOOL isMoving;
@property ( nonatomic, readwrite ) BOOL isAnimating;

@property ( nonatomic , strong ) NSMutableArray <SKTexture *> *characterMoveTextures;
@property ( nonatomic , strong ) SKTexture *characterInitTexture;
@property ( nonatomic , strong ) SKTextureAtlas *characterTextureAtlas;
//@property ( nonatomic , strong ) NSMutableArray *characterTextures;

@end

@interface Eater()



@end

@implementation Eater

+ (Eater *)character {
    return [[self alloc] init];
}

- (Eater *)init {
    
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"eater"];

    self = [super initWithTexture:[atlas textureNamed: [[atlas textureNames] firstObject]]];
    if (self) {
        self.characterTextureAtlas = atlas;
        self.characterInitTexture = [atlas textureNamed: [[atlas textureNames] firstObject]];
        self.characterMoveTextures = [@[] mutableCopy];
        for (int i = 0 ; i < 5 ; i ++ ) {
            [self.characterMoveTextures addObject: [atlas textureNamed: [[NSString stringWithFormat: @"eater%d", i ] png]]];
        }
        
        self.characterSpeed = 300;
        
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.position = CGPointMake(750, 1900);
       // self.size = CGSizeMake(155, 107);
        self.zPosition = 2;
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius: self.size.width / 2];
        self.physicsBody.allowsRotation = NO;
        self.physicsBody.pinned = YES;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.dynamic = YES;
        self.physicsBody.categoryBitMask = 1;
        self.physicsBody.contactTestBitMask = 0;
        self.name = @"eater";

    }
    return self;
}

@end
