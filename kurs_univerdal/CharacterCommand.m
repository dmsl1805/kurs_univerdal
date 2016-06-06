//
//  CharacterCommand.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/1/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "CharacterCommand.h"
@interface CharacterCommand ()
@property ( nonatomic, strong ) AbstractCharacter *character;

@end

@implementation CharacterCommand

- (instancetype)initWithCharacter:(AbstractCharacter *)character{
    self = [super init];
    if (self) {
        self.character = character;
    }
    return self;
}

- (void)moveToPoint:(CGPoint)point{
    if(self.character){
        [self.character moveToPoint:point];
    }
}
- (void)stop{
    if(self.character){
        [self.character stopMoving];
    }
}

@end
