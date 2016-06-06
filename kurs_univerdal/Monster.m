//
//  Monster.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/29/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "Monster.h"
#import "NSString+png.h"

@interface AbstractCharacter()

@property ( nonatomic, readwrite ) BOOL isMoving;
@property ( nonatomic, readwrite ) BOOL isAnimating;

@property ( nonatomic , strong ) NSMutableArray <SKTexture *> *characterMoveTextures;
@property ( nonatomic , strong ) SKTexture *characterInitTexture;
@property ( nonatomic , strong ) SKTextureAtlas *characterTextureAtlas;
//@property ( nonatomic , strong ) NSMutableArray *characterTextures;

@end

@interface Monster()



@end

@implementation Monster

+ (Monster *)character {
    return [[self alloc] init];
}

- (Monster *)init {
    
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"eater"];
    
    self = [super initWithTexture:[atlas textureNamed: [[atlas textureNames] firstObject]]];
    if (self) {
        self.characterTextureAtlas = atlas;
        self.characterInitTexture = [atlas textureNamed: [[atlas textureNames] firstObject]];
        self.characterMoveTextures = [@[] mutableCopy];
        for (int i = 0 ; i < 3 ; i ++ ) {
            [self.characterMoveTextures addObject: [atlas textureNamed: [[NSString stringWithFormat: @"eater%d", i ] png]]];
        }
        
        self.characterSpeed = 150;
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.size = CGSizeMake(155, 107);
        self.zPosition = 2;
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius: self.size.width / 2];
        self.physicsBody.allowsRotation = NO;
        self.physicsBody.pinned = NO;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.dynamic = YES;
        self.physicsBody.categoryBitMask = 2;
        self.physicsBody.contactTestBitMask = 1;
        
        self.color = [UIColor redColor];
        self.colorBlendFactor = 1;
        self.name = @"monster";
        
    }
    return self;
}

@end
