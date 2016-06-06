//
//  MonstersIterator.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/1/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameTypesFactory.h"

@class Monster;

@interface MonstersIterator : NSObject

@property ( nonatomic ) GameLevel gameLevel;

- (Monster *)firstObject;
- (void)enumerateMonstersUsingBlock:(void (^)(Monster *monster))enumerator;
@end
