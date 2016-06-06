//
//  LinearMove.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/2/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterMoving.h"

@interface LinearMove : NSObject <CharacterMoving>
@property ( nonatomic, readonly ) BOOL isAnimating;
@end
