//
//  CBTestAniViewController.m
//  CB_Test_01
//
//  Created by Elaine on 16--15.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBTestAniViewController.h"
#import "UIImageView+CBImageView.h"

@interface CBTestAniViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *herLabel;
@end

@implementation CBTestAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initMyView];
    [self changeViewAni];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"动画" style:UIBarButtonItemStylePlain target:self action:@selector(aniShow)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)aniShow
{
    self.herLabel.transform = CGAffineTransformMakeScale(0, 0);
    self.herLabel.alpha = 0;
    
    [UIView animateWithDuration:3 animations:^{
        self.herLabel.transform = CGAffineTransformMakeScale(0, 1);
        self.myLabel.transform = CGAffineTransformMakeScale(0, 0.1);
        self.myLabel.alpha = 0;
        self.herLabel.alpha = 1;
    }];
}

- (void)initMyView
{
    self.myView.layer.masksToBounds = YES;
    self.myView.layer.cornerRadius = 30.0f;
}

- (void)changeViewAni
{
    CGPoint center = self.myView.center;
    CGPoint startCenter = center;
    
    startCenter.y += [UIScreen mainScreen].bounds.size.height;
    self.myView.center = startCenter;
    
    [UIView animateWithDuration:1.5 delay:0.35 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.myView.center = center;
    } completion:^(BOOL finished) {
        self.myView.backgroundColor = [UIColor redColor];
    }];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.cui = @"cuibing";
    
    NSLog(@"---%@", imageView.cui);
    
}

@end
