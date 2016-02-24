//
//  CBSelectImageViewController.m
//  CB_Test_01
//
//  Created by Elaine on 15--1.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBSelectImageViewController.h"

@interface CBSelectImageViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)selectButtonClicked:(UIButton *)sender;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger num;

@end

@implementation CBSelectImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initMyTimer];
}

- (IBAction)selectButtonClicked:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 验证定时器
- (void)initMyTimer
{
    self.num = 0;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(myTest1) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)myTest1
{
    self.num++;
    NSLog(@"-------%li", self.num);
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
