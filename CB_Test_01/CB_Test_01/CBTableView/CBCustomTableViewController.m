//
//  CBCustomTableViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--26.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBCustomTableViewController.h"

@interface CBCustomTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation CBCustomTableViewController

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBCustomTableViewCellIndex"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBCustomTableViewCellIndex"];
    }
    
    cell.textLabel.text = self.arrayData[indexPath.row];
    
    return cell;
}

#pragma mark - 模拟请求数据
- (void)loadData
{
    [self.arrayData removeAllObjects];
    for (int i = 0; i < 5; i++) {
        NSString *str = [NSString stringWithFormat:@"%i行", i];
        [self.arrayData addObject:str];
    }
}

@end
