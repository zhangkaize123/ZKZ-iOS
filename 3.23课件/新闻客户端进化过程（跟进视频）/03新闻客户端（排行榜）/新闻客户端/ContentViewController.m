//
//  ContentViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-31.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ContentViewController.h"
#import "ZKZNews.h"
#import "FMDB.h"
#import "AppDelegate.h"
@interface ContentViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentText;
@property (weak, nonatomic) IBOutlet UILabel *authorText;
@property (weak, nonatomic) IBOutlet UILabel *titleText;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.authorText.text=self.news.author;
    self.titleText.text=self.news.title;
    self.contentText.text=self.news.content;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveData:)];
    
}
#pragma mark----保存按钮方法
-(void)saveData:(UIBarButtonItem *)sender
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    //判断是否有该新闻
    //@"select * from news where idid=?",self.news.idid
    FMResultSet *rs=[db executeQuery:@"select * from NewsO where idid=?",self.news.idid];
    
        if ([rs next]) {
        //提示你已经收藏了该新闻
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"你已经收藏了该新闻" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    //如果没有就进行收藏
    FMResultSet *set=[db executeQuery:@"select pic from news where idid=?",self.news.idid ];
    [set next];
    NSData *data=[set dataForColumn:@"pic"];
    BOOL b=[ db executeUpdate:@"insert into NewsO(idid,title,subtitle,picture,content,author,flid,click,time,pic) values(?,?,?,?,?,?,?,?,?,?)",self.news.idid,self.news.title,self.news.subtitle,self.news.picture,self.news.content,self.news.author,self.news.flid,self.news.click,self.news.time,data];
    if (b) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"收藏成功" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

@end
