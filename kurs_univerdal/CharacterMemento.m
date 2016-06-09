//
//  CharacterMemento.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/8/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "CharacterMemento.h"
#import "CharacterState.h"

@interface CharacterMemento()

@property ( nonatomic, strong ) CharacterState *localState;

@end

@implementation CharacterMemento

- (instancetype)initWithState:(CharacterState *)state {
    self = [super init];
    if (self) {
        self.localState = [[CharacterState alloc]init];
        [self.localState setCharacterPosition: state.characterPosition];
        [self.localState setCharacterZRotation: state.characterZRotation];
        [self.localState setCharacterVelocity: state.characterVelocity];
    }
    return self;
}

- (CharacterState *)getState {
    return  self.localState;
}

@end
