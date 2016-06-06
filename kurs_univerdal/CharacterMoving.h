//
//  CharacterMoving.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/2/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@class AbstractCharacter;

@protocol CharacterMoving <NSObject>
- (void)moveCharacter:(AbstractCharacter *)character toPoint:(CGPoint)point withTextures:(NSArray*)textures;

- (void)stopCharacter;
@end
