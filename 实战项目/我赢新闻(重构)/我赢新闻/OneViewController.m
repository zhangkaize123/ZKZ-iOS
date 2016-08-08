//
//  OneViewController.m
//  我赢新闻
//
//  Created by wyzc on 15/4/13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "OneViewController.h"
#import "DetailViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect=self.view.frame;
    float width=rect.size.width;
    //导航栏上的分类
    scrollView=[[HScrollView alloc]init];
    scrollView.frame=CGRectMake(0, 20, width, 44);
    //新闻按钮
    UIButton * btnXinwen=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnXinwen setTitle:@"新闻" forState:UIControlStateNormal];
    [btnXinwen setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnXinwen.tag=1;
    [btnXinwen addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnXinwen];
    //国内按钮
    UIButton * btnGuonei=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnGuonei setTitle:@"国内" forState:UIControlStateNormal];
    //btnGuonei.backgroundColor=[UIColor grayColor];
    [btnGuonei setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnGuonei.tag=2;
    [btnGuonei addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView  addButton:btnGuonei];
    //国际按钮
    UIButton * btnGuoji=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnGuoji setTitle:@"国际" forState:UIControlStateNormal];
    [btnGuoji setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnGuoji.tag=3;
    [btnGuoji addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnGuoji];
    //社会按钮
    UIButton * btnShehui=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnShehui setTitle:@"社会" forState:UIControlStateNormal];
    [btnShehui setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnShehui.tag=4;
    [btnShehui addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnShehui];
    //公益按钮
    UIButton * btnGongyi=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnGongyi setTitle:@"公益" forState:UIControlStateNormal];
    [btnGongyi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnGongyi.tag=5;
    [btnGongyi addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnGongyi];
    
    self.navigationItem.titleView=scrollView;
    flid=1;
}
-(void)viewDidAppear:(BOOL)animated
{
    [self loadDataWithFlid:flid];
}
-(void)loadDataWithFlid:(int)_id
{
    BOOL b=[ZHQUtil isConnection];
    if(!b)//没有网络
    {
        [self loadDataWithDatabaseWithFlid:_id];//从本地数据库中显示数据
    }
    else
    {
        [self loadDataWithNetworkWithFlid:_id];//从远程加载数据
    }
}

//单击分类按钮
-(void)onTap:(UIButton *)sender
{
    [scrollView clearColor];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    flid=(int)sender.tag;
    [self loadDataWithFlid:flid];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHQNews * news=self.news[indexPath.row];
    DetailViewController * detail=[[DetailViewController alloc]init];
    detail.news=news;
    [self.navigationController pushViewController:detail animated:YES];
}
@end
