//
//  FlyweightTextureFactory.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/6/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "FlyweightTextureFactory.h"

@implementation FlyweightTextureFactory

NSMutableDictionary *_imageDictionary;

+(SKTexture *)getTexture:(NSString *)textureName {
    if (!_imageDictionary)
        _imageDictionary = [[NSMutableDictionary alloc] init];
    if (![_imageDictionary objectForKey:textureName]) {
        UIImage *img = [UIImage imageNamed:@"blackhole"];
        SKTexture *txtr = [SKTexture textureWithImage:img];
        [_imageDictionary setObject:txtr forKey:textureName];
        NSLog(@"Loading image of the %@", textureName);
    }
    return [_imageDictionary objectForKey:textureName]; }
@end
