//
//  ViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--26.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "ViewController.h"
#import "CBTest1ViewController.h"
#import "CBSelectImageViewController.h"
#import "CBBezierTestViewController.h"
#import "CB_Test_01-Bridging-Header.h"
#import "CBGradientLayerTestViewController.h"
#import "CBMasonryViewController.h"
#import "CBBlurViewController.h"
#import "CBPOPViewController.h"
#import "CB_Test_01-Bridging-Header.h"
#import "CBTestAniViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *cbTableView;
@property (strong, nonatomic) NSMutableArray *arrayData;

@end

@implementation ViewController

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = [NSMutableArray arrayWithObjects:@"UITableView继承练习", @"选择图片测试", @"贝塞尔曲线", @"CALayer练习", @"渐变图层", @"Masonry练习", @"模糊效果", @"POP动画", @"Swift练习", @"UIView动画", @"计步器练习", @"显示动画", @"链表练习", nil];
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBTestViewCellIndex"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBTestViewCellIndex"];
    }
    
    cell.textLabel.text = self.arrayData[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:     //  UITableView继承练习
        {
            [self turnToTest1VC];
        }
            break;
            
        case 1:     //  选择图片
        {
            [self turnToSelctImageVC];
        }
            break;
            
        case 2:     //  贝塞尔曲线
        {
            [self turnToBezierVC];
        }
            break;
            
        case 3:     //  CALayer练习
        {
            [self turnToCALayerTestVC];
        }
            break;
            
        case 4:     //  渐变图层
        {
            [self turnToGradientLayerVC];
        }
            break;
            
        case 5:     //  Masonry练习
        {
            [self turnToMasonryVC];
        }
            break;
            
        case 6:     //  模糊效果
        {
            [self turnToBlurVC];
        }
            break;
            
        case 7:     //  POP动画
        {
            [self turnToPopVC];
        }
            break;
            
        case 8:     //  Swift练习
        {
            [self turnToSwiftVC];
        }
            break;
            
        case 9:     //  UIView动画
        {
            [self turnToViewAni];
        }
            break;
            
        case 10:
        {
            [self turnToStempTest];
        }
            break;
            
        case 11:
        {
            [self turnToShowAniVC];
        }
            break;
            
        case 12:        //  链表练习
        {
            [self turnToNodeTestVC];
        }
            break;
            
            default:
            break;
    }
}

#pragma makr - UITableView继承练习
- (void)turnToTest1VC
{
    CBTest1ViewController *test1VC = [[CBTest1ViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:test1VC animated:YES];
}

//  选择图片
- (void)turnToSelctImageVC
{
    CBSelectImageViewController *selectImageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBSelectImageVC"];
    [self.navigationController pushViewController:selectImageVC animated:YES];
}

// 贝塞尔曲线
- (void)turnToBezierVC
{
    CBBezierTestViewController *bezierTestVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBBezierTestVC"];
    [self.navigationController pushViewController:bezierTestVC animated:YES];
}

//  CALayer练习
- (void)turnToCALayerTestVC
{
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"CBTestLayerVC"] animated:YES];
}

//  渐变图层
- (void)turnToGradientLayerVC
{
    CBGradientLayerTestViewController *gradientLayerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBGradientLayerVC"];
    [self.navigationController pushViewController:gradientLayerVC animated:YES];
}

//  Masonry练习
- (void)turnToMasonryVC
{
    CBMasonryViewController *masonryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBMasonryVC"];
    [self.navigationController pushViewController:masonryVC animated:YES];
}

//  模糊效果
- (void)turnToBlurVC
{
    CBBlurViewController *blurVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBBlurVC"];
    [self.navigationController pushViewController:blurVC animated:YES];
}

//  POP动画
- (void)turnToPopVC
{
    CBPOPViewController *popVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBPopVC"];
    [self.navigationController pushViewController:popVC animated:YES];
}

//  Swift练习
- (void)turnToSwiftVC
{
    UIViewController *learnSwiftVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBLearnSwiftVC"];
    
    [self.navigationController pushViewController:learnSwiftVC animated:YES];
}

//  UIView动画
- (void)turnToViewAni
{
    CBTestAniViewController *testAniVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBTestAniVC"];
    [self.navigationController pushViewController:testAniVC animated:YES];
}

//  计步器练习
- (void)turnToStempTest
{
    UIViewController *stempVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBStempVC"];
    [self.navigationController pushViewController:stempVC animated:YES];
}

//  显示动画
- (void)turnToShowAniVC
{
    UIViewController *showAniVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBShowAniVC"];
    [self.navigationController pushViewController:showAniVC animated:YES];
}

//  链表练习
- (void)turnToNodeTestVC
{
    UIViewController *nodeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBNodeTestVC"];
    [self.navigationController pushViewController:nodeVC animated:YES];
}

@end
