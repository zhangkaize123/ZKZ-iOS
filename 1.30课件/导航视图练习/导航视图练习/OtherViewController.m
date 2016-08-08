//
//  OtherViewController.m
//  导航视图练习
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad
{
    
    
    self.view.backgroundColor=[UIColor orangeColor];
    
    text=[[UITextField alloc]initWithFrame:CGRectMake(50, 100, 100, 40)];
    text.backgroundColor=[UIColor brownColor];
    text.text=self.sendstring;
    text.enabled=NO;
    [self.view addSubview:text];
    button=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edittag:)];
    self.navigationItem.rightBarButtonItem=button;
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)edittag:(UIBarButtonItem*)sender
{
    if ([(NSString *)button.title isEqualToString:@"编辑"])
    {
        
        text.enabled=YES;
        button.title=@"完成";
        
    }
    else
    {
        self.main.updata=text.text;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    
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

@end
