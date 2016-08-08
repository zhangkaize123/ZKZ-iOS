//
//  DetailViewController.m
//  通讯录
//
//  Created by wyzc on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "DetailViewController.h"
#import "EditViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
-(void)passValueWithName:(NSString *)name andWithTel:(NSString *)tel
{
    nameLabel.text=name;
    numberLabel.text=tel;
    NSString * str=[[NSString alloc]initWithFormat:@"%@,%@",name,tel ];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"UPDATE" object:str];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //编辑按钮
    UIBarButtonItem * bbi=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editTap:)];
    self.navigationItem.rightBarButtonItem=bbi;
    //姓名
    nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 74, 200, 40)];
    nameLabel.text=self.person.name;
    nameLabel.font=[UIFont boldSystemFontOfSize:24];
    [self.view addSubview:nameLabel];
    //手机：
    UILabel * telLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 134, 200, 40)];
    telLabel.text=@"手机";
    //telLabel.font=[UIFont boldSystemFontOfSize:24];
    [self.view addSubview:telLabel];
    //手机号
    numberLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 174, 200, 40)];
    numberLabel.text=self.person.tel;
    numberLabel.font=[UIFont boldSystemFontOfSize:24];
    [self.view addSubview:numberLabel];
}
-(void)editTap:(UIBarButtonItem *)sender
{
    //编辑视图
    EditViewController * edit=[[EditViewController alloc]init];
    edit.person=self.person;
    edit.delegate=self;
    [self.navigationController pushViewController:edit animated:NO];
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
