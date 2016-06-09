//
//  CharacterStateCareTaker.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/8/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "CharacterStateCareTaker.h"
#import "CharacterOriginator.h"
#import "CharacterState.h"
#import "CharacterMemento.h"

@interface CharacterStateCareTaker ()

@property ( nonatomic , strong ) CharacterOriginator *originator;
@property ( nonatomic , strong ) CharacterMemento *memento;

@end

@implementation CharacterStateCareTaker

- (CharacterOriginator *)originator {
    if ( !_originator ) {
        _originator = [[CharacterOriginator alloc]init];
    }
    return  _originator;
}

- (void) setPosition:(CGPoint)position {
    [self.originator setPosition:position];
}
- (void) setRotation:(CGFloat)zRotation {
    [self.originator setZRotation:zRotation];
}
- (void) setVelocity:(CGVector)velocity {
    [self.originator setVelocity:velocity];
}

- (void) saveState {
    self.memento = [[CharacterMemento alloc] initWithState:[self.originator getState]];
}

- (void) loadState {
    [self.originator setState:[self.memento getState]];
}

@end
