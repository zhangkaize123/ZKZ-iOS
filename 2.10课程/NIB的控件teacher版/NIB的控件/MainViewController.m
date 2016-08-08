//
//  MainViewController.m
//  NIB的控件
//
//  Created by wyzc on 15-2-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
}
-(void)timer:(id)sender
{
    static int n=0;
    if(isRunning)
    {
        n++;
        if(n>10)
        {
            n=0;
        }
        self.walkCtrl.progress=0.1*n;
    }
    //NSLog(@"%@",[NSDate date]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)okTap:(UIButton *)sender {
    NSString * str=self.numberText.text;
    int num=[str intValue];
    int sum=0;
    for(int i=1;i<=num;i++)
    {
        sum+=i;
    }
    self.numberText.text=[NSString stringWithFormat:@"%d",sum];
}
- (IBAction)fontSlider:(UISlider *)sender {
    
    self.numberText.font=[UIFont systemFontOfSize:sender.value];
    self.valueLabel.text=[NSString stringWithFormat:@"%d",(int)sender.value];
}

- (IBAction)onChanged:(UISwitch *)sender {
    self.sw1.on=sender.on;
    self.sw2.on=sender.on;
}
//启动
- (IBAction)startTap:(UIButton *)sender {
    //让指示器运动起来
    [self.runCtrl startAnimating];
    //把启动按钮封了
    sender.enabled=NO;
    //把停止按钮活了
    self.stopButton.enabled=YES;
    isRunning=YES;
}

- (IBAction)stopTap:(UIButton *)sender {
    //让指示器停下来
    [self.runCtrl stopAnimating];
    //把启动按钮活了
    self.startButton.enabled=YES;
    //把停止按钮封了
    sender.enabled=NO;
    isRunning=NO;
}
@end
