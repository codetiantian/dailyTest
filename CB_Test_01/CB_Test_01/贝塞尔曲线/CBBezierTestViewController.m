//
//  CBBezierTestViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--1.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBBezierTestViewController.h"

@interface CBBezierTestViewController ()

//@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@end

@implementation CBBezierTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test6];
}

/**
 *  画矩形
 */
- (void)test1
{
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.frame = CGRectMake(100, 100, 100, 150);
    shapeLayer.backgroundColor = [[UIColor blackColor] CGColor];
//    self.shapeLayer = shapeLayer;
    [self.view.layer addSublayer:shapeLayer];
}

/**
 *  使用贝塞尔曲线画矩形
 */
- (void)test2
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 150)];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:shapeLayer];
}

/**
 *  使用贝塞尔曲线画椭圆（圆）
 */
- (void)text3
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 200) cornerRadius:100];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:shapeLayer];
}

/**
 *  使用贝塞尔曲线画半圆
 */
- (void)test4
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100.0 startAngle:M_PI_4 endAngle:-M_PI_2 clockwise:NO];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    
    animation.repeatCount = 3;
    animation.duration = 5.0f;
    animation.fromValue = @0;
    animation.toValue = @6;
    [shapeLayer addAnimation:animation forKey:nil];
}

#pragma mark - 圆
- (void)test5
{
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:10 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];;
   
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path1.CGPath;
    shapeLayer.fillColor = [[UIColor redColor] CGColor];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAni.autoreverses = NO;
    basicAni.repeatCount = 1;
    basicAni.duration = 5;
    basicAni.fromValue = (__bridge id _Nullable)(path1.CGPath);
    basicAni.toValue = (__bridge id _Nullable)(path.CGPath);
    
    //  让动画不可逆<不推荐>
    basicAni.fillMode = kCAFillModeForwards;
    basicAni.removedOnCompletion = NO;
    
    [shapeLayer addAnimation:basicAni forKey:nil];
    
//    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    //  动画结束后改变path<推荐>
//    shapeLayer.path = path.CGPath;
}


- (void)test6
{
    //  画一个不规则的图形
    CGSize finalSize = CGSizeMake(CGRectGetWidth(self.view.frame), 400);
    CGFloat layerHeight = finalSize.height * 0.2;
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    UIBezierPath *bezier = [[UIBezierPath alloc] init];
    
    [bezier moveToPoint:CGPointMake(10, finalSize.height - layerHeight)];
    [bezier addLineToPoint:CGPointMake(10, finalSize.height - 1)];
    [bezier addLineToPoint:CGPointMake(finalSize.width - 10, finalSize.height - 1)];
    [bezier addLineToPoint:CGPointMake(finalSize.width - 10, finalSize.height - layerHeight)];
    [bezier addQuadCurveToPoint:CGPointMake(10, finalSize.height - layerHeight) controlPoint:CGPointMake((finalSize.width - 20) / 2, finalSize.height - layerHeight - 50)];
    layer.path = bezier.CGPath;
    layer.fillColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:layer];
}

@end
