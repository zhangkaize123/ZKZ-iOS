//
//  MainViewController.m
//  NIB
//
//  Created by 张凯泽 on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
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

- (IBAction)showTage:(id)sender

{
    int sum=0;
    NSString *number=self.showtext.text;
    int a=[number intValue];
    for (int i=1; i<=a; i++)
    {
        sum+=i;
    }
    NSString *sumstring=[NSString stringWithFormat:@"%d",sum];
    
    self.showtext.text=sumstring;
    
    
}


- (IBAction)iiiiii:(id)sender
{
    
    [self.showtext resignFirstResponder];
}
@end
