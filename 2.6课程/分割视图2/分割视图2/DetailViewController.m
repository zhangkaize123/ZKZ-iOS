//
//  DetailViewController.m
//  分割视图2
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "DetailViewController.h"
#import "PopViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(zhongwenTage:) name:@"ZHONGWEN" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pinyinTage:) name:@"PINYIN" object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showTage:) name:@"SHOW" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(editTage:) name:@"EDIT" object:nil];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"详细";
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"语言" style:UIBarButtonItemStylePlain target:self action:@selector(languagetage:)];
    self.navigationItem.rightBarButtonItem=right;
    lable=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2+50, 600, 200, 40)];
    lable.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:lable];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)showTage:(id)obj
{
    string=[obj object];
    lable.text=string;
    //NSLog(@"详细菜单里%@",lable.text);
}
-(void)editTage:(id)obj
{
    NSString *s5=[obj object];
    
    lable.text=s5;
}
-(void)zhongwenTage:(id)obj
{
    lable.text=string;
    
    //NSLog(@"详细彩蛋中中文");
}
-(void)pinyinTage:(id)obj
{
    //NSLog(@"详细彩蛋中拼音");
    NSString *s3=[self phonetic:lable.text];
    lable.text=s3;

}


- (NSString *) phonetic:(NSString*)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}


-(void)languagetage:(UIBarButtonItem *)sender
{
    
    //UIViewController *vc=[[UIViewController alloc]init];
    PopViewController *view=[[PopViewController alloc]init];
    //创建弹出视图
    UIPopoverController *pop=[[UIPopoverController alloc]initWithContentViewController:view];
    //设定弹出的尺寸
    //pop.popoverContentSize=CGSizeMake(100, 100);
    //显示弹出视图
    [pop presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    //关闭视图
    //[pop dismissPopoverAnimated:YES];
    
    
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
