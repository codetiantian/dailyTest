//
//  CBStempViewController.m
//  CB_Test_01
//
//  Created by Elaine on 16--16.
//  Copyright © 2016年 yinuo. All rights reserved.
//

@import CoreMotion;
@import AVFoundation;

#import "CBStempViewController.h"

#define userDefaults [NSUserDefaults standardUserDefaults]

@interface CBStempViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myValueLabel;
- (IBAction)beginButton;
- (IBAction)stopButtonClicked;

@property (copy, nonatomic) NSString *strStempNum;  //  步数

@property (strong, nonatomic) CMPedometer *pedometer;
//@property (strong, nonatomic) NSDateFormatter *timestampFormatter;
@property (strong, nonatomic) AVSpeechSynthesizer *announcer;

@end

@implementation CBStempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"计步器";
    
    self.pedometer = [[CMPedometer alloc] init];
    self.announcer = [[AVSpeechSynthesizer alloc] init];
    
//    self.timestampFormatter = [[NSDateFormatter alloc] init];
//    self.timestampFormatter.locale = [NSLocale autoupdatingCurrentLocale];
//    self.timestampFormatter.timeZone = [NSTimeZone localTimeZone];
//    self.timestampFormatter.dateStyle = NSDateFormatterNoStyle;
//    self.timestampFormatter.timeStyle = NSDateFormatterMediumStyle;
    
    if (![userDefaults stringForKey:@"stempNumKey"]) {
        self.strStempNum = @"0";
    } else {
        self.strStempNum = [userDefaults stringForKey:@"stempNumKey"];
    }
    
    self.myValueLabel.text = self.strStempNum;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清零" style:UIBarButtonItemStyleDone target:self action:@selector(cleanCurrentStempNumButtonClicked)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//  开始记步
- (IBAction)beginButton {
    
     __weak __typeof(self)weakSelf = self;

    CMPedometerHandler handler = ^(CMPedometerData *pedometerData, NSError *error){
         __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (strongSelf) {
                    self.myValueLabel.text = @"There was an error.";
                }
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (strongSelf) {
                    [strongSelf handlePedometerData:pedometerData];
                }
            });
        }
    };
    
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:handler];
}

//  停止记步
- (IBAction)stopButtonClicked {
    [self.pedometer stopPedometerUpdates];
    
    [self saveCurrentStempNum];
}

- (void)saveCurrentStempNum
{
    [userDefaults setObject:self.myValueLabel.text forKey:@"stempNumKey"];
    [userDefaults synchronize];
}


// updated approximately every 2.5 seconds?
- (void)handlePedometerData:(CMPedometerData *)pmData {
    
    // Log it
    NSLog(@"Data Received: %@", pmData);
    
//    NSString *timestampString = [self.timestampFormatter stringFromDate:pmData.endDate];
//    NSString *logString = [NSString stringWithFormat:@"%@ - %@ steps",
//                           timestampString, pmData.numberOfSteps];
//    [self.stepCountLog addObject:logString];
    
    NSString *strAllStempNum = [NSString stringWithFormat:@"%li", [self.strStempNum integerValue] + [pmData.numberOfSteps integerValue]];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
        self.myValueLabel.text = strAllStempNum;
//    });
    
    // Display it
//    NSString *floorString;
    
//    if ([CMPedometer isFloorCountingAvailable]) {
//        floorString = [NSString stringWithFormat:@"Floors: %@ up, %@ down",
//                       pmData.floorsAscended, pmData.floorsDescended];
//    } else {
//        floorString = @"(Floor counts not available on this device.)";
//    }
//    
//    self.resultsLabel.text = [NSString stringWithFormat:@"%@ steps\n%1.2f meters\n%@\n\n(Update #%ld)",
//                              pmData.numberOfSteps, [pmData.distance doubleValue],
//                              floorString, self.stepCountLog.count];
    
    
    // Speak it
    NSString *countString =[NSString stringWithFormat:@"%@ steps", pmData.numberOfSteps];
    AVSpeechUtterance *countUtterance = [[AVSpeechUtterance alloc] initWithString:countString];
    countUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    countUtterance.rate = 0.3;
    
    [self.announcer speakUtterance:countUtterance];
}

- (void)cleanCurrentStempNumButtonClicked
{
    self.myValueLabel.text = @"0";
    self.strStempNum = @"0";
}

- (void)dealloc
{
    [self saveCurrentStempNum];
}

@end
