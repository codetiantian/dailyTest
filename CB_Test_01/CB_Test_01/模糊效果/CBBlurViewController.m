//
//  CBBlurViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--24.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBBlurViewController.h"

#define MainSize [UIScreen mainScreen].bounds.size

@interface CBBlurViewController ()

@property (strong, nonatomic) UIVisualEffectView *effectView;

- (IBAction)openButtonClicked;
@end

@implementation CBBlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initMyEffectView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initMyEffectView
{
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    effectView.frame = self.view.bounds;
    effectView.alpha = 0;
    self.effectView = effectView;
    
    [self.view addSubview:self.effectView];
}

- (IBAction)openButtonClicked {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.effectView.alpha = 0.8;
    }];
}
@end
