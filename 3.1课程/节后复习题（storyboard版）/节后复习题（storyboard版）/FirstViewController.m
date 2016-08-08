//
//  FirstViewController.m
//  节后复习题（storyboard版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLable;
- (IBAction)dismissTap;
@property (weak, nonatomic) IBOutlet UITextField *inputText;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
}
-(void)setStr:(NSString *)str
{
    _str=str;
    
}

- (IBAction)dismissTap {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate firstValue:self.inputText.text];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.showLable.text=_str;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
