//
//  EaterBuilder.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 5/30/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "EaterBuilder.h"
#import "Eater.h"

@interface CharacterBuilder()

@property (nonatomic, strong) AbstractCharacter *character;

@end

@implementation EaterBuilder

- (EaterBuilder *)initCharacter {
    self.character = [Eater character];
    return self;
}

@end
