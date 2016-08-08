//
//  ViewController.m
//  分区和索引表示图练习
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor orangeColor];
    //建立名字的字典
    self.names=[[NSMutableDictionary alloc]initWithCapacity:1000];
    self.keyname=[[NSMutableSet alloc]initWithCapacity:26];
    for (int i=0; i<10; i++)
    {
        int a=arc4random()%26;
        a=a+'A';
        int b=arc4random()%26;
        b=b+'a';
        int c=arc4random()%26;
        c=c+'a';
        int d=arc4random()%26;
        d=d+'a';
        int e=arc4random()%26;
        e=e+'a';
        //NSLog(@"%c%c%c%c%c",a,b,c,d,e);
        NSString *cap=[NSString stringWithFormat:@"%c",a];
        //把大写字母加到集合中去
        [self.keyname addObject:cap];
        //生成cap对应的数组
        NSMutableArray *array=[self.names objectForKey:cap];
        //判断是否有这个数组
        if (array==nil)
        {
            array=[[NSMutableArray alloc]initWithCapacity:100];
        }
        NSString *name=[NSString stringWithFormat:@"%c%c%c%c%c",a,b,c,d,e];
        [array addObject:name];
        [self.names setObject:array forKey:cap];
    }
    [self.keyname addObject:UITableViewIndexSearch];
    
    
    
    
    sb=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
    sb.autocapitalizationType=UITextAutocapitalizationTypeNone;

    
    [self.view addSubview:sb];
    
    
    UITableView *tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStyleGrouped];
    [self.view addSubview:tableview];
    tableview.delegate=self;
    tableview.dataSource=self;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSArray *key=[self.keyname allObjects];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"key.count%lu",(unsigned long)key.count);
    return key.count;
    
    //return self.keyname.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //[self.keyname removeObject:UITableViewIndexSearch];
    NSArray *key=[self.keyname allObjects];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    NSArray *name=[self.names objectForKey:key[section]];
    
    NSLog(@"%@",name);
    return name.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    
    NSArray *key=[self.keyname allObjects];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    NSArray *name=[self.names objectForKey:key[indexPath.section]];
    cell.textLabel.text=name[indexPath.row];
    NSLog(@"%@",UITableViewIndexSearch);
    return cell;
}
////设置头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
//设置titleForHeader区头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *key=[self.keyname allObjects];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    return key[section];
}
//索引
-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    NSArray *key=[self.keyname allObjects];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    return key;
}


















- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
