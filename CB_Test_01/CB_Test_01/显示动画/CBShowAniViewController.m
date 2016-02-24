//
//  CBShowAniViewController.m
//  CB_Test_01
//
//  Created by Elaine on 16--23.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBShowAniViewController.h"
#import <WebKit/WebKit.h>

@interface CBShowAniViewController ()

@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (weak, nonatomic) CAShapeLayer *shapeLayer;

@end

@implementation CBShowAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initMyImageView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(beginButtonClicked)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initMyImageView
{
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    self.shapeLayer = shapeLayer;
    
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 104, 157)];
    self.imageView1.image = [UIImage imageNamed:@"group1"];
    [self.view addSubview:self.imageView1];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 104, 157)];
    self.imageView2.image = [UIImage imageNamed:@"group2"];
    //  mask :添加遮层
    self.imageView2.layer.mask = shapeLayer;
    [self.view addSubview:self.imageView2];
    
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithRect:self.imageView2.bounds];
    self.shapeLayer.path = bezierPath1.CGPath;
    self.shapeLayer.speed = 1;
}

- (void)beginButtonClicked
{
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithRect:self.imageView2.bounds];
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 104, 0)];
    [self.shapeLayer removeAllAnimations];
    
    //  动画
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAni.fromValue = bezierPath1;
    basicAni.toValue = bezierPath2;
    basicAni.duration = 5;
    [self.shapeLayer addAnimation:basicAni forKey:nil];
    self.shapeLayer.path = bezierPath2.CGPath;
}

- (void)test
{
    
}

@end
