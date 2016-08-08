//
//  DetilViewController.m
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "DetilViewController.h"

@interface DetilViewController ()

@end

@implementation DetilViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"详细信息";
    //姓名UILabel
    namelable=[[UILabel alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 40)];
    namelable.backgroundColor=[UIColor lightGrayColor];
    namelable.text=self.p1.name;
    //带字体加宽的字体格式
    namelable.font=[UIFont boldSystemFontOfSize:25];
    [self.view addSubview:namelable];
        //设置线。
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(10, 130, self.view.frame.size.width-20, 1)];
    line.backgroundColor=[UIColor brownColor];
    [self.view addSubview:line];
    //显示电话字样
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 141, self.view.frame.size.width-20, 40)];
    //lable.backgroundColor=[UIColor lightGrayColor];
    lable.text=@"手机号：";
    lable.font=[UIFont boldSystemFontOfSize:25];
    [self.view addSubview:lable];
    //设置电话UILable
    telable=[[UILabel alloc]initWithFrame:CGRectMake(10, 191, self.view.frame.size.width-20, 40)];
    telable.backgroundColor=[UIColor lightGrayColor];
    telable.text=self.p1.tel;
    telable.font=[UIFont boldSystemFontOfSize:25];
    [self.view addSubview:telable];
    //设置线
    UIView *line2=[[UIView alloc]initWithFrame:CGRectMake(10, 241, self.view.frame.size.width-20, 1)];
    line2.backgroundColor=[UIColor brownColor];
    [self.view addSubview:line2];
    //右侧编辑按钮
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editage:)];
    self.navigationItem.rightBarButtonItem=right;
    //左侧返回按钮
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returntag:)];
    self.navigationItem.leftBarButtonItem=left;
    // Do any additional setup after loading the view.
}
// 实现从Edit___>self协议
-(void)passvalue:(ZKZPerson *)p3
{
    namelable.text=p3.name;
    telable.text=p3.tel;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"UPDATA" object:p3];
    
    
}
//编辑界面入口
-(void)editage:(UIBarButtonItem *)sender
{
    NSLog(@"右侧俺怒");
    EditViewController *edit=[[EditViewController alloc]init];
    //other---->main
    edit.delegate1=self;
    //main---->other
    ZKZPerson *p5=[[ZKZPerson alloc]init];
    p5.name=namelable.text;
    p5.tel=telable.text;
    edit.p2=p5;
    [self.navigationController pushViewController:edit animated:NO];
}

-(void)returntag:(UIBarButtonItem *)sender
{
    //NSLog(@"左侧俺怒");
    [self.navigationController popToRootViewControllerAnimated:NO];
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
