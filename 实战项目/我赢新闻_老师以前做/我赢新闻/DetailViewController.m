//
//  DetailViewController.m
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-28.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "fmdb/FMDatabase.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"显示新闻";
        UIBarButtonItem * rightButton=[[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(saveTap:)];
        self.navigationItem.rightBarButtonItem=rightButton;
    }
    return self;
}
-(void)saveTap:(id)sender
{
    //获得数据库
    AppDelegate * app=[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    //判断是否已经收藏
     NSString * sql=[NSString stringWithFormat:@"select count(*) as rows from  saves where idid=%@",self.news.idid];
    FMResultSet * rs=[db executeQuery:sql];
    [rs next];
    int rscount=[rs intForColumn:@"rows"];
    if(rscount>0)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"新闻已经收藏了！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    sql=[NSString stringWithFormat:@"select pic from  news where idid=%@",self.news.idid];
    rs=[db executeQuery:sql];
    [rs next];
    NSData * data=[rs dataForColumn:@"pic"];
    BOOL b=[db executeUpdate:@"insert into saves(idid,title,subtitle,picture,content,author,flid,time,clicks,pic) values(?,?,?,?,?,?,?,?,?,?)",self.news.idid,self.news.title,self.news.subtitle,self.news.picture,self.news.content,self.news.author,self.news.flid,self.news.time,self.news.clicks,data];
    if(!b)
    {
        NSLog(@"insert into error!");
    }
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"收藏成功！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.titleLabel.text=self.news.title;
    self.authorLabel.text=self.news.author;
    self.contentText.text=self.news.content;
}

@end
