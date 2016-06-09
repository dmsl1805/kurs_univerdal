//
//  CharacterState.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/8/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CharacterState : NSObject

@property ( nonatomic ) CGPoint characterPosition;
@property ( nonatomic ) CGFloat characterZRotation;
@property ( nonatomic ) CGVector characterVelocity;

@end
