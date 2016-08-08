//
//  ViewController.m
//  节后复习题（storyboard版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
/*
 
 利用故事版来进行多控件的传值：
 问题1.
 main——————》other注意
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 NSString *string=[self.segView titleForSegmentAtIndex:[self.segView selectedSegmentIndex]];
 FirstViewController *one=segue.destinationViewController;
 one.delegate=self;
 one.str=string;
 }
 问题2.
other－－－－》main
 注意使用代理方法；
 
 */
@interface ViewController ()<ZKZFirstviewdelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segView;
- (IBAction)okTap;
@property (weak, nonatomic) IBOutlet UITextField *showText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)okTap {
    if (self.segView.selectedSegmentIndex==0) {
        [self performSegueWithIdentifier:@"one" sender:nil];
        
    }else{
        [self performSegueWithIdentifier:@"two" sender:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *string=[self.segView titleForSegmentAtIndex:[self.segView selectedSegmentIndex]];
    FirstViewController *one=segue.destinationViewController;
    one.delegate=self;
    one.str=string;
}
-(void)firstValue:(NSString *)sendrstr
{
    self.showText.text=sendrstr;
    
}
@end
