//
//  DetilViewController.m
//  分割试图
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "DetilViewController.h"
#import "LanguageTableViewController.h"
#import "ZHQAlert.h"
@interface DetilViewController ()
{
    UILabel *showlabel;
    
}
@end

@implementation DetilViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"详细";
    [super viewDidLoad];
    showlabel=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, (self.view.frame.size.height-40)/2, 300, 40)];
    
    showlabel.backgroundColor=[UIColor orangeColor];
    showlabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:showlabel];
    //创建语言选择
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"语言" style:UIBarButtonItemStylePlain target:self action:@selector(languageTage:)];
    self.navigationItem.rightBarButtonItem=right;
    // Do any additional setup after loading the view.
}
//创建语言选择按钮方法实现
-(void)languageTage:(UIBarButtonItem*)sender
{
    //创建弹出试图
    LanguageTableViewController *languageTV=[[LanguageTableViewController alloc]initWithStyle:UITableViewStylePlain];
    self.pop=[[UIPopoverController alloc]initWithContentViewController:languageTV];
    [self.pop presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    languageTV.d=self;
    self.pop.popoverContentSize=CGSizeMake(200, 300);
    
}
//从语言选择器里传过来的语言类型
-(void)setLanguageString:(NSString *)languageString
{
    //注意一下不要在设值了＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    _languageString=languageString;
    
    //NSLog(@"%@",languageString);
    if ([languageString isEqualToString:@"中文"])
    {
        showlabel.text=_name;
    }
    else
    {
        
        
        
        if (_name==nil )
        {
            [ZHQAlert alert:@"不能为空"];
            return;
        }
        else{
        NSString *string=_name;
        string=[self phonetic:_name];
        showlabel.text=string;
        }
    }
    
    //
}
- (NSString *) phonetic:(NSString*)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}

//main----->detail
-(void)setName:(NSString *)name
{
    _name=name;//set方法里边的name用这个类的属性去接受不要自己去定义
    showlabel.text=_name;
    
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
