//
//  ZKZTableView.m
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZTableView.h"
#define  Width [UIScreen mainScreen].bounds.size.width;
#define Height [UIScreen mainScreen].bounds.size.height;
@interface ZKZTableView()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
}
@property(nonatomic,strong)NSMutableArray *array;
@end

@implementation ZKZTableView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        [self addSubview:tableview];
        tableview.dataSource=self;
        tableview.delegate=self;
        self.array=[NSMutableArray array];
    }
    return self;
}
#pragma mark----加载tableView
+(instancetype)loadView
{
    CGFloat tableViewX=0;
    CGFloat tableViewY=194;
    CGFloat tableViewW=Width;
    CGFloat tableViewH=Height-tableViewY-49;
    ZKZTableView *tableView=[[ZKZTableView alloc]initWithFrame:CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH)];
    return tableView;
}
#pragma mark-----实现表示图的数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *ID=@"mycell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    ZKZNews *news=[self.group.groups objectAtIndex:indexPath.row];
    cell.textLabel.text=news.title;
    return cell;
}
#pragma mark-------表示图的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建展示详细内容的的控制器
    
}
#pragma mark----- 重写ZKZGroupNews set方法
-(void)setGroup:(ZKZGroupNews *)group
{
    _group=group;
    for (ZKZNews *news in group.groups) {
        [self.array addObject:news];
    }

   // NSLog(@"------------%@",self.array);
    //重新加载
    [tableview reloadData];
    
    
    
}
@end
