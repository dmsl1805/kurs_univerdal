//
//  CharacterCommand.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/1/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractCharacter.h"

@interface CharacterCommand : NSObject

- (instancetype)initWithCharacter:(AbstractCharacter *)character;

- (void)moveToPoint:(CGPoint)point;
- (void)stop;

@end
