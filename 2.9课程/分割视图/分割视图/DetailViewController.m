//
//  DetailViewController.m
//  分割视图
//
//  Created by wyzc on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "DetailViewController.h"
#import "LanguageTableViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"详细";
    UIBarButtonItem * rightButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"语言" style:UIBarButtonItemStylePlain target:self action:@selector(languageTap:)];
    self.navigationItem.rightBarButtonItem=rightButtonItem;
    
    //显示姓名标签
    nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-200,self.view.frame.size.height/2-20 , 400, 40)];
    nameLabel.backgroundColor=[UIColor blackColor];
    nameLabel.textColor=[UIColor yellowColor];
    nameLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
}
-(void)languageTap:(UIBarButtonItem *)sender
{
    //在弹出视图上显示的视图
    LanguageTableViewController * vc=[[LanguageTableViewController alloc]initWithStyle:UITableViewStylePlain];
    vc.detail=self;
    vc.view.backgroundColor=[UIColor whiteColor];
    //弹出视图
    self.popVC=[[UIPopoverController alloc]initWithContentViewController:vc];
    //设定大小
    self.popVC.popoverContentSize=CGSizeMake(100, 100);
    
    //显示弹出视图
    [self.popVC presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    //关闭
    //[popVC dismissPopoverAnimated:YES];
}
-(void)setName:(NSString *)name
{
    _name=name;
    nameLabel.text=name;
}
-(void)setLanguage:(NSString *)language
{
    NSLog(@"%@",self.name);
    
    if([language isEqualToString:@"中文"])
    {
        nameLabel.text=_name;
    }
    else
    {
        nameLabel.text=[self phonetic:_name];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *) phonetic:(NSString*)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
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
