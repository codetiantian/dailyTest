//
//  CBPOPViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--25.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBPOPViewController.h"
#import <POP.h>

@interface CBPOPViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;
@end

@implementation CBPOPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"POP动画";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self myTest3];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  POPBasicAnimation      基础动画
- (void)myTest1
{
    POPBasicAnimation *aniBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    aniBasic.toValue = @(self.myView.center.x + 200);
    aniBasic.duration = 0.3;
    aniBasic.beginTime = CACurrentMediaTime() + 1.0f;
    aniBasic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.myView pop_addAnimation:aniBasic forKey:@"position"];
}

//  POPSpringAnimation      弹簧效果
- (void)myTest2
{
    POPSpringAnimation *aniSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    aniSpring.toValue = @(self.myView.center.x + 200);
    aniSpring.beginTime = CACurrentMediaTime() + 1.0f;
    aniSpring.springBounciness = 10.0f;
    aniSpring.springSpeed = 0.5f;
    [self.myView pop_addAnimation:aniSpring forKey:@"position"];
}

//  POPDecayAnimation       衰减动画
- (void)myTest3
{
    POPDecayAnimation *aniDecay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    aniDecay.velocity = @(500);
    aniDecay.beginTime = CACurrentMediaTime() + 1.0f;
    [self.myView pop_addAnimation:aniDecay forKey:@"position"];
}

@end
