//
//  CBTest1ViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--26.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBTest1ViewController.h"

@interface CBTest1ViewController ()

@end

@implementation CBTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"11111";
    [self loadTest1Data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadTest1Data
{
    [self loadData];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"------点击了%@数据", self.arrayData[indexPath.row]);
}

@end
