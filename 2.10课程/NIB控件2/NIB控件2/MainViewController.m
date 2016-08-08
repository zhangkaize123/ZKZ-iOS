//
//  MainViewController.m
//  NIB控件2
//
//  Created by 张凯泽 on 15-2-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    NSTimer *timer;
}
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
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
//Button
- (IBAction)okTap:(UIButton *)sender
{
    
    NSString *numstr=self.numbertap.text;
    int number=[numstr intValue];
    int sum=0;
    for (int i=1; i<number; i++)
    {
        sum+=i;
    }
    self.numbertap.text=[NSString stringWithFormat:@"%d",sum];
    
    
}
//Slider
- (IBAction)valuechageTap:(UISlider *)sender

{
    //滑块使用的是。。。。。。。value。。。。。
    self.numbertap.font=[UIFont systemFontOfSize:sender.value];
    self.valuechangShow.text=[NSString stringWithFormat:@"%d",(int)sender.value];
    
}
//Switch
- (IBAction)stateChange:(UISwitch *)sender
{
    
    //两个按钮的点击事件可以用一个行为来使用
    self.sw1.on=sender.on;
    self.sw2.on=sender.on;
    
    
    
    
    
}

- (IBAction)startTap:(UIButton *)sender
{
    self.stop.enabled=YES;
    [self.actionShow startAnimating];
    self.start.enabled=NO;
    //float progress=0.1;
    
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timetage:) userInfo:nil repeats:YES];

    
    
}
-(void)timetage:(NSTimer *)sender

{
    static BOOL flag=YES;
    if (flag==YES)
    {
    self.progressShow.progress+=0.1;
        if (self.progressShow.progress>=1)
        {
            flag=NO;
        }

    }
    
    if (flag==NO)
    {
        self.progressShow.progress-=0.1;
        if (self.progressShow.progress<=0)
        {
            flag=YES;
        }
    }
    
}

- (IBAction)stopTap:(UIButton *)sender
{
    sender.enabled=NO;
    self.start.enabled=YES;
    [self.actionShow stopAnimating];
    self.actionShow.hidesWhenStopped=NO;
    
    [timer invalidate];
    
    
}
@end
