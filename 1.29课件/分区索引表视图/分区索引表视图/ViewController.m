//
//  ViewController.m
//  分区索引表视图
//
//  Created by wyzc on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.allKeys=[[NSMutableSet alloc]initWithCapacity:26];
    self.allNames=[[NSMutableDictionary alloc]initWithCapacity:26];
    //动态产生数据
    for(int i=0;i<1000;i++)//产生1000个五个字符
    {
        int a=arc4random()%26;
        a='A'+a;
        int aa=arc4random()%26;
        aa='a'+aa;
        int aaa=arc4random()%26;
        aaa='a'+aaa;
        int aaaa=arc4random()%26;
        aaaa='a'+aaaa;
        int aaaaa=arc4random()%26;
        aaaaa='a'+aaaaa;
        //把第一字符变成字符串
        NSString * key=[NSString stringWithFormat:@"%c",a];
        //加到关键字集合中
        [self.allKeys addObject:key];
        //获得这个关键字的集合
        NSMutableArray * array=[self.allNames objectForKey:key];
        if(array==nil)//里面还没有
        {
            array=[[NSMutableArray alloc]initWithCapacity:100];
        }
        [array addObject:[NSString stringWithFormat:@"%c%c%c%c%c",a,aa,aaa,aaaa,aaaaa]];
        [self.allNames setObject:array forKey:key];
    }
    //NSLog(@"%@",self.allKeys);
    //NSLog(@"%@",self.allNames);
    //NSString * path=NSHomeDirectory();
    //NSLog(@"%@",path);
    //path=[path stringByAppendingPathComponent:@"names.plist"];
    //[self.allNames writeToFile:path atomically:YES];
    UITableView * tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStyleGrouped];
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allKeys.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //把集合变成数组
    NSArray * array=[[self.allKeys allObjects]sortedArrayUsingSelector:@selector(compare:)];
    //得到这个区关键字
    NSString * key=array[section];
    //得到这个关键字的集合
    NSArray * names=[self.allNames objectForKey:key];
    //设定这个区显示多少行
    return names.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId=@"mycell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //把集合变成数组
    NSArray * array=[[self.allKeys allObjects]sortedArrayUsingSelector:@selector(compare:)];
    NSString * key=array[indexPath.section];
    NSArray * names=[self.allNames objectForKey:key];
    cell.textLabel.text=names[indexPath.row];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //把集合变成数组
    NSArray * array=[[self.allKeys allObjects]sortedArrayUsingSelector:@selector(compare:)];
    return array[section];
}
//设置索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //把集合变成数组
    NSArray * array=[[self.allKeys allObjects]sortedArrayUsingSelector:@selector(compare:)];
    return array;
}
//设置头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
