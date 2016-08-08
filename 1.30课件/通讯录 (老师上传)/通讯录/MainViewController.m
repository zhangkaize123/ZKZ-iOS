//
//  MainViewController.m
//  通讯录
//
//  Created by wyzc on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "ZHQPerson.h"
#import "DetailViewController.h"
#import "NSString+trim.h"
@interface MainViewController ()

@end

@implementation MainViewController
-(void)saveData
{
    NSString * path=NSHomeDirectory();//获得根路径
    path=[path stringByAppendingPathComponent:@"persons.plist"];//在路径后面加上文件名
    BOOL b=[NSKeyedArchiver archiveRootObject:allPerson toFile:path];
    if(!b)
    {
        NSLog(@"write file not success!");
    }
}
-(void)loadData
{
    NSString * path=NSHomeDirectory();//获得根路径
    path=[path stringByAppendingPathComponent:@"persons.plist"];//在路径后面加上文件名
    allPerson=[NSKeyedUnarchiver unarchiveObjectWithFile:path];//获得保存的联系人
    NSLog(@"path=%@,obj=%@",path,allPerson);
}
//响应通知
-(void)updatePerson:(id)obj
{
    //修改联系人
    
    //先删除
    [self deletePerson];
    NSString * str=[obj object];
    NSArray * arr=[str componentsSeparatedByString:@","];
    ZHQPerson * person=[[ZHQPerson alloc]init];
    person.name=arr[0];
    person.tel=arr[1];
    person.pinyin=[self phonetic:person.name];
    NSLog(@"%@",person);
    //再增加
    [self addPerson:person];
    [self saveData];
    allKey=[[allPerson allKeys]sortedArrayUsingSelector:@selector(compare:)];
    [self copyData];
    [self.tableView reloadData];
}
-(void)deletePerson
{
    //删除联系人
    NSString * key=[allKey objectAtIndex:current.section];//获得关键字
    NSMutableArray * arr=[allPerson objectForKey:key];//获得这个关键字里的数组
    [arr removeObjectAtIndex:current.row];//从集合里删除
    if(arr.count==0)
    {
        //删除关键字
        NSMutableArray * keys=[[NSMutableArray alloc]initWithArray:allKey];
        [keys removeObject:key];
        allKey=keys;
        //删除字典
        [allPerson removeObjectForKey:key];
    }
    else
    {
        [allPerson setObject:arr forKey:key];
    }
}
//响应通知
-(void)delPerson
{
    //NSLog(@"this is delete!");
    [self deletePerson];
    [self saveData];
    [self copyData];
    [self.tableView reloadData];
}
-(void)refreshTap:(id)sender
{
    [self copyData];
    [self.tableView reloadData];
}
-(void)copyData
{
    //清空
    [showPerson removeAllObjects];
    [showKey removeAllObjects];
    //放显示数据
    NSArray * keys=[[allPerson allKeys]sortedArrayUsingSelector:@selector(compare:)];
    for(NSString * str in keys)
    {
        NSString * newKey=[str copy];
        [showKey addObject:newKey];
        NSArray * old=[allPerson objectForKey:str];
        NSArray * newArr=[old copy];
        [showPerson setObject:newArr forKey:newKey];
    }
    //做标记
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //背景颜色
    self.view.backgroundColor=[UIColor whiteColor];
    //注册通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(delPerson) name:@"DELETE" object:nil];//删除
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updatePerson:) name:@"UPDATE" object:nil];//修改
    //获得数据(本地磁盘)
    [self loadData];
    if(allPerson==nil)
    {
        allPerson=[[NSMutableDictionary alloc]init];
    }
    allKey=[[allPerson allKeys]sortedArrayUsingSelector:@selector(compare:)];
    if(allKey==nil)
    {
        allKey=[[NSArray alloc]init];
    }
    //获得显示数据
    showPerson=[[NSMutableDictionary alloc]init];
    showKey=[[NSMutableArray alloc]init];
    [self copyData];
    NSLog(@"%@,%@",allPerson,allKey);
    NSLog(@"%@,%@",showPerson,showKey);
    //导航栏标题
    self.title=@"所有联系人";
    //导航栏左边按钮
    UIBarButtonItem * bbi1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTap:)];
    self.navigationItem.leftBarButtonItem=bbi1;
    //导航栏右边按钮
    UIBarButtonItem * bbi=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTap:)];
    self.navigationItem.rightBarButtonItem=bbi;
    //搜索栏
    UISearchBar * sb=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    sb.autocapitalizationType=UITextAutocapitalizationTypeNone;
    sb.autocorrectionType=UITextAutocorrectionTypeNo;
    sb.delegate=self;
    sb.tag=100;
    sb.placeholder=@"姓名或电话";
    [self.view addSubview:sb];
    //表视图
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height-104) style:UITableViewStyleGrouped];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
}
-(void)addTap:(UIBarButtonItem *)sender
{
    //显示添加联系人视图
    AddViewController * add=[[AddViewController alloc]init];
    add.delegate=self;
    [self.navigationController pushViewController:add animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addPerson:(ZHQPerson *)p
{
    //获得拼音的的一个字符
    NSString * key=[p.pinyin substringToIndex:1];
    //变成大写
    key=[key uppercaseString];
    NSMutableArray * arr=[allPerson objectForKey:key];
    if(arr==nil)
    {
        arr=[[NSMutableArray alloc]init];
    }
    [arr addObject:p];
    [allPerson setObject:arr forKey:key];

}
-(void)passValueWithName:(NSString *)name andWithTel:(NSString *)tel
{
    ZHQPerson * person=[[ZHQPerson alloc]init];
    person.name=name;
    person.tel=tel;
    person.pinyin=[self phonetic:name];
    
    [self addPerson:person];
    //保存到磁盘
    [self saveData];
    allKey=[[allPerson allKeys]sortedArrayUsingSelector:@selector(compare:)];
    [self copyData];
    [self.tableView reloadData];
    
    //NSLog(@"%@",person);
}
- (NSString *) phonetic:(NSString*)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}
#pragma mark - 搜索栏代理
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //获得要搜索的文本
    NSString * str=searchBar.text;
    //剔除两端的空格
    str=[str trim];
    //如果有要搜索的内容
    if(str.length>0)
    {
        //清空
        [showKey removeAllObjects];
        [showPerson removeAllObjects];
        //遍历原字典
        NSArray * keys=[allPerson allKeys];//获得所有关键字
        for(NSString * s in keys)//遍历关键字
        {
            NSMutableArray * newArr=[[NSMutableArray alloc]init];//创建一个空的集合
            //获得原来这个关键字的集合
            NSArray * arr=[allPerson objectForKey:s];
            for(ZHQPerson * p in arr)//遍历集合
            {
                if([p.name containsString:str] || [p.tel containsString:str])//符合条件
                {
                    //加到新集合
                    [newArr addObject:[p copy]];
                }
            }
            if(newArr.count>0)//如果当前关键字有数据
            {
                //加这个关键字
                [showKey addObject:s];
                 //加到显示字典
                [showPerson setObject:newArr forKey:[s copy]];
            }
        }
        //做标记
        [self.tableView reloadData];
    }
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton=NO;
    searchBar.text=@"";
    [self copyData];
    [self.tableView reloadData];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    searchBar.showsCancelButton=YES;
}

#pragma mark - UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return showKey.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * key=showKey[section];
    NSArray * array=[showPerson objectForKey:key];
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString * key=showKey[indexPath.section];
    NSArray * array=[showPerson objectForKey:key];
    ZHQPerson * p=array[indexPath.row];
    cell.textLabel.text=p.name;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return showKey[section];
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return showKey;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    current=indexPath;
    //NSLog(@"row=%d,col=%d",indexPath.row,indexPath.section);
    //详细视图
    NSString * key=showKey[indexPath.section];
    NSArray * array=[showPerson objectForKey:key];
    ZHQPerson * p=array[indexPath.row];
    DetailViewController * detail=[[DetailViewController alloc]init];
    detail.person=p;
    [self.navigationController pushViewController:detail animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    //NSLog(@"---%@---",allPerson);
    [self.tableView reloadData];
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
