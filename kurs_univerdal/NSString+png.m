//
//  NSString+png.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/3/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "NSString+png.h"

@implementation NSString (png)
- (NSString *)png{
    return [self stringByAppendingString:@".png"];
}
@end
