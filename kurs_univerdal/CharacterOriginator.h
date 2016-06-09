//
//  CharacterOriginator.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/8/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CharacterOriginator : NSObject

- (void)setPosition:(CGPoint)position;
- (void)setZRotation:(CGFloat)zRotation;
- (void)setVelocity:(CGVector)velocity;

- (CharacterOriginator *)getState;
- (void) setState:(CharacterOriginator *)state;

@end
