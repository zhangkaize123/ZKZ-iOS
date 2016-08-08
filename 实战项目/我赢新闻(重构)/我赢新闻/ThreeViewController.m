//
//  ThreeViewController.m
//  我赢新闻
//
//  Created by wyzc on 15/4/13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar * searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
    searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
    searchBar.delegate=self;
    [self.tableView setTableHeaderView:searchBar];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString * text=searchBar.text;
    text=[text trim];
    if([text isEqualToString:@""])
    {
        [ZHQUtil alert:@"请提供你想搜索的关键字！"];
        searchBar.text=@"";
        [searchBar becomeFirstResponder];
        return;
    }
    //提示加载
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeBlack];

    if([ZHQUtil isConnection]==NO)//如果没有网络
    {
        [ZHQUtil alert:@"没有有效的网络连接，无法进行搜索操作！"];
    }
    else//有网络
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSURL * url=[NSURL URLWithString:[NSString stringWithFormat:@"%@getsearchs.php",[ZHQUtil hostname]]];
            NSMutableURLRequest * request=[NSMutableURLRequest requestWithURL:url];
            [request setHTTPMethod:@"post"];
            NSString * parameter=[NSString stringWithFormat:@"content=%@",text];
            [request setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
            NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            if(data!=nil)
            {
                [self performSelectorOnMainThread:@selector(actionData:) withObject:data waitUntilDone:YES];
            }
            else
            {
                [ZHQUtil alert:@"对不起，没有这样标题的新闻！"];
            }
        });
    }
    [self.tableView reloadData];
}
-(void)actionData:(NSData *)_data
{
    [self.news removeAllObjects];
    //对数据进行json解析
    NSArray * news=[NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableLeaves error:nil];
    if(news==nil)//返回的数据无效
    {
        [ZHQUtil alert:@"对不起，没有这样标题的新闻！"];
        [SVProgressHUD dismiss];
        return;
    }
    if([news count]>0)//有新闻
    {
        for(NSDictionary * dict in news)//遍历每个新闻
        {
            NSArray * keys=[dict allKeys];
            ZHQNews * xinwen=[[ZHQNews alloc]init];
            for(NSString * str in keys)
            {
                //对对象的属性一一賦值kvc
                [xinwen setValue:[dict objectForKey:str] forKey:str];
            }
            //下载图片
            NSString * imgName=[NSString stringWithFormat:@"%@images/%@",[ZHQUtil hostname],xinwen.picture];
            NSURL * url=[NSURL URLWithString:imgName];
            NSURLRequest * request=[NSURLRequest requestWithURL:url];
            NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            xinwen.img=[UIImage imageWithData:data];
            [self.news addObject:xinwen];
        }
    }
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
}

@end
