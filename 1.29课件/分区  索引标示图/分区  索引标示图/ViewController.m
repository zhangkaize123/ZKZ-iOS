//
//  ViewController.m
//  分区  索引标示图
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
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.allkeys=[[NSMutableSet alloc]initWithCapacity:26];
    self.allnames=[[NSMutableDictionary alloc]initWithCapacity:1000];
    //动态产生数据
    for(int i=0;i<1000;i++)
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
        //把第一个字符变成字符穿
        NSString *key=[NSString stringWithFormat:@"%c",a];
        //夹道关键子集合中去
        [self.allkeys addObject:key];
        //获得这个关键子的集合
        NSMutableArray *array=[self.allnames objectForKey:key];
        if (array==nil)
        {
            array=[[NSMutableArray alloc]initWithCapacity:100];
        }
        [array addObject:[NSString stringWithFormat:@"%c%c%c%c%c",a,aa,aaa,aaaa,aaaaa]];
        [self.allnames setObject:array forKey:key];
        NSLog(@"array=%@",array);

    }
        NSString *path=NSHomeDirectory();
    path=[path stringByAppendingPathComponent:@"names.plist"];
    NSLog(@"%@",path);
    [self.allnames writeToFile:path atomically:YES];
    
    NSLog(@"%@",self.allnames);
    CGRect rect=CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) ;
    UITableView *tableview=[[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    
    tableview.delegate=self;
    tableview.dataSource=self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    NSArray *array=[self.allkeys allObjects];
    array=[array sortedArrayUsingSelector:@selector(compare:)];
    
    
    return array.count;
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *array=[self.allkeys allObjects];
    array=[array sortedArrayUsingSelector:@selector(compare:)];
    NSArray *a=[self.allnames objectForKey:array[section]];
    
    return a.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    
    NSArray *array=[self.allkeys allObjects];
    array=[array sortedArrayUsingSelector:@selector(compare:)];
    NSArray *a=[self.allnames objectForKey:array[indexPath.section]];
    cell.textLabel.text=a[indexPath.row];
    
    
    
    return cell;
}
//区头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSArray *array=[self.allkeys allObjects];
    array=[array sortedArrayUsingSelector:@selector(compare:)];
   // NSArray *a=[self.allnames objectForKey:array[section]];
    return array[section];
}
// 索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    NSArray *array=[self.allkeys allObjects];
    array=[array sortedArrayUsingSelector:@selector(compare:)];
    return array;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
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
