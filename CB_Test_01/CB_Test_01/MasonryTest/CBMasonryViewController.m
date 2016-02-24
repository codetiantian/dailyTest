//
//  CBMasonryViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--21.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBMasonryViewController.h"
#import <Masonry.h>

@interface CBMasonryViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@end

@implementation CBMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Masonry";
    
    [self initMyView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initMyView
{
    UIView *myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor greenColor];
    [self.myScrollView addSubview:myView];
    
    [myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.myScrollView).offset(15);
        make.centerX.equalTo(self.myScrollView);
        make.width.equalTo(self.myScrollView).multipliedBy(0.6);
        make.height.equalTo(self.myScrollView).multipliedBy(0.5);
    }];
}

@end
