//
//  FlyweightTextureFactory.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/6/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface FlyweightTextureFactory : NSObject

+(SKTexture *)getTexture:(NSString *)textureName;

@end
