//
//  CBGradientLayerTestViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--21.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBGradientLayerTestViewController.h"

@interface CBGradientLayerTestViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) NSArray *colors;      //  渐变颜色的数组
@property (strong, nonatomic) NSArray *locations;   //  渐变颜色的区间分布
@property (weak, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation CBGradientLayerTestViewController

- (NSArray *)colors
{
    if (!_colors) {
        _colors = [NSArray arrayWithObjects:(id)[[[UIColor blackColor] colorWithAlphaComponent:1.0] CGColor], (id)[[[UIColor yellowColor]colorWithAlphaComponent:1.0] CGColor], (id)[[[UIColor blueColor] colorWithAlphaComponent:1.0] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    }
    
    return _colors;
}

- (NSArray *)locations
{
    if (!_locations) {
        _locations = [NSArray arrayWithObjects:
                      [NSNumber numberWithFloat:0.0],
                      [NSNumber numberWithFloat:0.3],
                      [NSNumber numberWithFloat:0.5],
                      [NSNumber numberWithFloat:0.8],
                      nil];
    }
    
    return _locations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"渐变图层";
    
    [self initMyGradientLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initMyGradientLayer
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.myImageView.bounds;
    
    //  设置渐变颜色方向
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    //  设定颜色组
    gradientLayer.colors = self.colors;
    
    //  设定颜色分割点
    gradientLayer.locations = self.locations;
    
    self.gradientLayer = gradientLayer;
    [self.myImageView.layer addSublayer:self.gradientLayer];
}


@end
