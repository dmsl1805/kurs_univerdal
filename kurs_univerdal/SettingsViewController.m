//
//  SettingsViewController.m
//  kurs_univerdal
//
//  Created by Dmitriy Shulzhenko on 6/3/16.
//  Copyright © 2016 3. All rights reserved.
//

#import "SettingsViewController.h"
#import "GameViewController.h"
#import "GameTypesFactory.h"

@interface SettingsViewController ()

@property (strong, nonatomic) IBOutlet UIButton *hardButton;
@property (strong, nonatomic) IBOutlet UIButton *superHardButton;
@property (strong, nonatomic) IBOutlet UIButton *easyButton;

@property (strong, nonatomic) IBOutlet UISlider *eaterSlider;
@property (strong, nonatomic) IBOutlet UISlider *monsterSlider;

@property (nonatomic) GameLevel gameLevel;
@property (nonatomic) BOOL isAnimated;

@end

@implementation SettingsViewController
- (void)viewDidLoad {
    self.gameLevel = ChildLevel;
}
- (IBAction)backButtonPressed:(UIButton *)sender {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
        GameViewController *vc = (GameViewController *)self.presentingViewController;
        vc.gameLevel = self.gameLevel;
    }
    
}
- (IBAction)superHardLevelPressed:(UIButton *)sender {
    self.gameLevel = SuperHardLevel;
    
    self.superHardButton.backgroundColor = [UIColor colorWithRed:254/255.f green:165/255.f blue:40/255.f alpha:1];
    self.hardButton.backgroundColor = [UIColor orangeColor];
    self.easyButton.backgroundColor = [UIColor orangeColor];
    self.eaterSlider.value = 0.5;
    self.monsterSlider.value = 0.5;
    
    [self animateBackgroundView:sender completion:nil];

}

- (IBAction)hardLevelPressed:(UIButton *)sender {
    self.gameLevel = AdultLevel;
    
    self.hardButton.backgroundColor = [UIColor colorWithRed:254/255.f green:165/255.f blue:40/255.f alpha:1];
    self.superHardButton.backgroundColor = [UIColor orangeColor];
    self.easyButton.backgroundColor = [UIColor orangeColor];
    self.eaterSlider.value = 0.6;
    self.monsterSlider.value = 0.4;
    
    [self animateBackgroundView:sender completion:nil];

}
- (IBAction)easyLevelPressed:(UIButton *)sender {
    self.gameLevel = ChildLevel;
    
    self.easyButton.backgroundColor = [UIColor colorWithRed:254/255.f green:165/255.f blue:40/255.f alpha:1];
    self.hardButton.backgroundColor = [UIColor orangeColor];
    self.superHardButton.backgroundColor = [UIColor orangeColor];
    self.eaterSlider.value = 0.7;
    self.monsterSlider.value = 0.3;
    
    [self animateBackgroundView:sender completion:nil];
}

- (void)animateBackgroundView:(UIButton *)viewToAnimate completion:(void (^ __nullable)())completion{
    if ( self.isAnimated ) {
        return;
    }
    self.isAnimated = YES;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = @(viewToAnimate.frame.size.width / 2);
    animation.toValue = @((viewToAnimate.frame.size.width + 100) / 2);
    animation.duration = 1.0;
    [viewToAnimate.layer addAnimation:animation forKey:@"cornerRadius"];
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        viewToAnimate.frame = CGRectMake(viewToAnimate.frame.origin.x - 50,
                                         viewToAnimate.frame.origin.y - 50,
                                         viewToAnimate.frame.size.width + 100,
                                         viewToAnimate.frame.size.height + 100);
    } completion:^(BOOL finished) {
        if ( completion ) {
            completion();
        }
        weakSelf.isAnimated = NO;
    }];
    
}

@end
