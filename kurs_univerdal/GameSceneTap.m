//
//  GameSceneTap.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/2/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "GameSceneTap.h"
#import "CharacterMoving.h"
#import "TapMove.h"
#import "CharacterCommandExecutor.h"

@interface GameSceneTap()
@property ( nonatomic ) CGPoint lastTouch;
@property ( nonatomic, strong ) id <CharacterMoving> characterMoving;
@property ( nonatomic, strong ) CharacterCommandExecutor *eaterExecutor;

@end

@implementation GameSceneTap

- (id<CharacterMoving>)characterMoving {
    if( !_characterMoving ){
        _characterMoving = [[TapMove alloc] init];
    }
    return _characterMoving;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lastTouch = [[touches anyObject] locationInNode: self];
    [self.eaterExecutor executeCommandForPoint: self.lastTouch];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.eater stopMoving];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lastTouch = [[touches anyObject] locationInNode: self];
    [self.eater stopMoving];
}
@end
