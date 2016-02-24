//
//  CBCustomTableViewController.h
//  CB_Test_01
//
//  Created by Elaine on 15--26.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBCustomTableViewController : UITableViewController

/**
 *  数据源
 */
@property (strong, nonatomic) NSMutableArray *arrayData;

/**
 *  加载数据
 */
- (void)loadData;

@end
