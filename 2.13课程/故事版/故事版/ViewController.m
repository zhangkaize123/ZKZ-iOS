//
//  ViewController.m
//  故事版
//
//  Created by 张凯泽 on 15-2-13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "otherViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    otherViewController *other=segue.destinationViewController;
    other.v=self;
    other.senderstring=self.textfiled.text;
    
}
-(void)setUpdatestring:(NSString *)updatestring
{
    self.textfiled.text=updatestring;
    NSLog(@"%@",updatestring);
}


@end
