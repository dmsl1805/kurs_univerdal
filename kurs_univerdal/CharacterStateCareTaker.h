//
//  CharacterStateCareTaker.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/8/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CharacterStateCareTaker : NSObject
@property ( nonatomic ) CGPoint position;
@property ( nonatomic ) CGFloat rotation;
@property ( nonatomic ) CGVector velocity;

- (void) saveState;
- (void) loadState;

@end
