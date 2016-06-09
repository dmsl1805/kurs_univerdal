//
//  CharacterOriginator.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/8/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "CharacterOriginator.h"
#import "CharacterState.h"

@interface CharacterOriginator ()

@property ( nonatomic , strong ) CharacterState *localState;

@end

@implementation CharacterOriginator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.localState = [[CharacterState alloc]init];
    }
    return self;
}

- (void)setPosition:(CGPoint)position {
    self.localState.characterPosition = position;
}
- (void)setZRotation:(CGFloat)zRotation {
    self.localState.characterZRotation = zRotation;
}
- (void)setVelocity:(CGVector)velocity {
    self.localState.characterVelocity = velocity;
}

- (CharacterOriginator *)getState {
    return self.localState;
}
- (void) setState:(CharacterOriginator *)state {
    self.localState = state;
    //NSLog(@"Load completed. Current state: int = %i, string = %@", _localState.intValue, _localState.stringValue);
}


@end
