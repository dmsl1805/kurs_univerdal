//
//  CharacterCommandExecutor.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/1/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "CharacterCommandExecutor.h"
#import "CharacterCommand.h"

@interface CharacterCommandExecutor ()
@property (nonatomic , strong) CharacterCommand *command;
@end

@implementation CharacterCommandExecutor

-(void)addCommand:(CharacterCommand *)command{
    self.command = command;
}
-(void)removeCommand{
    self.command = nil;
}
-(void)executeCommandForPoint:(CGPoint)point{
    [self.command moveToPoint:point];
}

@end
