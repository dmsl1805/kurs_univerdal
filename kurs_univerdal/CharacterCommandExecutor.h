//
//  CharacterCommandExecutor.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/1/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@class CharacterCommand;

@interface CharacterCommandExecutor : NSObject
-(void)addCommand:(CharacterCommand *)command;
-(void)removeCommand;
-(void)executeCommandForPoint:(CGPoint)point;
@end
