//
//  SceneViewController.h
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/3/16.
//  Copyright © 2016 3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameTypesFactory.h"

@interface SceneViewController : UIViewController

@property (nonatomic) GameMode gameMode;
@property (nonatomic) GameLevel gameLevel;

@end
