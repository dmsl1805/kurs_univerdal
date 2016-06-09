//
//  CharacterMemento.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/8/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CharacterState;

@interface CharacterMemento : NSObject

-(instancetype) initWithState:( CharacterState *)state;
-(CharacterState *) getState;

@end
