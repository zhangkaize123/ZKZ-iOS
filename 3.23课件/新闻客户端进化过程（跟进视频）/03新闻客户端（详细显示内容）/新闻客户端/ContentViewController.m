//
//  ContentViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-31.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ContentViewController.h"
#import "ZKZNews.h"
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
    
}


@end
