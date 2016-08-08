//
//  MainViewController.m
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "ZKZPerson.h"
#import "NSString+Tirming.h"
#import "DetilViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deleteperson) name:@"DELE" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updatavalue:) name:@"UPDATA" object:nil];
    path=[NSHomeDirectory() stringByAppendingPathComponent:@"person.plist"];
    NSLog(@"%@",path);
    allnames=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    currentnames=[[NSMutableDictionary alloc]initWithCapacity:100];
    currentkeys=[[NSMutableArray alloc]init];
    allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    //allnames=[[NSMutableDictionary alloc]initWithCapacity:100];
    
    if (allnames==nil)
    {
        allnames=[[NSMutableDictionary alloc]initWithCapacity:100];
        
        allkeys=[[NSArray alloc]init];
        
    }
    [self follow];
    //da导航栏标题
    self.title=@"所有联系人";
    //导航栏右边按钮
    UIBarButtonItem *bbi=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addtap:)];
    self.navigationItem.rightBarButtonItem=bbi;
    [super viewDidLoad];
    //搜索栏
    searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    searchbar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:searchbar];
    searchbar.delegate=self;
    //表示图
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height-104) style:UITableViewStyleGrouped];
       [self.view addSubview:tableview];
    tableview.delegate=self;
    tableview.dataSource=self;
    
    // Do any additional setup after loading the view.
}
-(void)follow
{
    [currentkeys removeAllObjects];
    [currentnames removeAllObjects];
    for (NSString *s in allkeys)
    {
        NSMutableArray *array=[allnames objectForKey:s];
        //
        //[currentkeys addObject:s];
        NSMutableArray *arr1=[[NSMutableArray alloc]init];
        for (ZKZPerson *p in array)
        {
            [arr1 addObject:[p copy]];
        }
        [currentnames setObject:arr1 forKey:s];
        [currentkeys addObject:s];
        NSLog(@"currentnames=%@,currentkeys=%@",currentnames,currentkeys);
        
    }
    
    
}
//编辑信息
-(void)updatavalue:(id)sender
{
    //NSLog(@"%@",sender);
    ZKZPerson *p6=[[ZKZPerson alloc]init];
    p6=[[sender object]copy];
    //删除
    NSString *str=[allkeys objectAtIndex:indexp.section];
    NSMutableArray *array=[allnames objectForKey:str];
    [array removeObjectAtIndex:indexp.row];
    if (array.count==0)
    {
        [allnames removeObjectForKey:str];
        //NSLog(@"******%@",allnames);
        allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    }
    else
    {
        [allnames setObject:array forKey:str];
        allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    }
    //添加
    int a=1;
    NSString *s2=[self phonetic:p6.name];
    //NSLog(@"s2====%@",s2);
    s2=[[s2 substringToIndex:1]uppercaseString];
    NSMutableArray *arr1=[[NSMutableArray alloc]init];
    for (NSString *s3 in allnames)
    {
        
        if ([s3 isEqualToString:s2])
        {
            arr1=[allnames objectForKey:s3];
            [arr1 addObject:p6];
            a=2;
        }
    }
    [allnames setObject:arr1 forKey:s2];
    allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    if (a==1)
    {
        NSMutableArray *arr2=[[NSMutableArray alloc]init];
        [arr2 addObject:p6];
        [allnames setObject:arr2 forKey:s2];
        allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    }
    [self follow];
    [NSKeyedArchiver archiveRootObject:allnames toFile:path];
    [tableview reloadData];
    
}
//删除联系人通知方法
-(void)deleteperson
{
    NSMutableArray *keys=[[NSMutableArray alloc]initWithArray:allkeys];
    NSString *key=[keys objectAtIndex:indexp.section];
    NSLog(@"key=%@",key);
   NSMutableArray *personinfo= [allnames objectForKey:key];
    [personinfo removeObjectAtIndex:indexp.row];
    if (personinfo.count==0)
    {
        //[keys removeObject:key];
        [allnames removeObjectForKey:key];
        allkeys= [[allnames allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
    }
    else
    {
        [allnames setObject:(NSArray *)personinfo forKey:key];
        allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];

     //allkeys=[(NSArray *)keys sortedArrayUsingSelector:@selector(compare:)];
    //[allnames setObject:personinfo forKey:key];
    
    }
    [self follow];
    [NSKeyedArchiver archiveRootObject:allnames toFile:path];
    [tableview reloadData];
    
}
//搜索:
//
//-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
//{
//    
//    return YES;
//}
//点击搜索//-------搜索到的数据再进行删除与修改如何操作。
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    /*BOOL flag=YES;
   // NSLog(@"这是搜索按钮");
    NSMutableDictionary *current=[allnames mutableCopy];
    NSString *str=searchbar.text;
    str=[str tirming];
    NSString *str1=[[str substringToIndex:1]uppercaseString];
    for (NSString *s in allkeys)
    {
        if ([s isEqualToString:str1])
        {
            
            NSMutableArray *array=[[allnames objectForKey:str1]mutableCopy];
            [allnames removeAllObjects];
            //＊＊＊＊字典中执行removeAllObjects以后里边的值和键都消失＊＊＊＊＊＊＊＊＊
            //NSLog(@"**********%@",[allnames allKeys]);
            [allnames setObject:array forKey:s];
            allkeys =[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
            [tableview reloadData];
            flag=NO;
            return;
        }
    }
    if (flag==YES)
    {
        //没有此人
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有此人" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        searchbar.text=@"";
        [allnames removeAllObjects];
        allnames=[current mutableCopy];
        
        [tableview reloadData];
        
    }
    */
    NSString *str=searchbar.text;
    str =[str tirming];
    if(str.length>0)
    {
        
    NSMutableArray *arr3=[[NSMutableArray alloc]init];
    //NSMutableArray *arr1=[[NSMutableArray alloc]init];
    [allnames removeAllObjects];
    
    for (NSString *s1 in currentkeys)
    {
        NSMutableArray *arr1=[currentnames objectForKey:s1];
        for (ZKZPerson *p1 in arr1)
        {
            
            if ([p1.name containsString:str]||[p1.tel containsString:str])
            {
                NSMutableArray *arr2=[allnames objectForKey:[p1.name substringToIndex:1]];
                if (arr2==nil)
                {
                    arr2=[[NSMutableArray alloc]init];
                }
                [arr2 addObject:p1];
                [arr3 addObject:[p1.name substringToIndex:1]];
                [allnames setObject:arr2 forKey:[p1.name substringToIndex:1]];
                allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
            }
            else
            {
                allkeys=[allnames allKeys];
            }
        }
    }
    
    [tableview reloadData];
    }
}
//点击取消
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //[self follow];
    searchbar.showsCancelButton=NO;
    searchbar.text=@"";
    [allnames removeAllObjects];
    allnames =[currentnames mutableCopy];
    allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    [NSKeyedArchiver archiveRootObject:allnames toFile:path];
    [tableview reloadData];
   /*// NSMutableDictionary *current=[allnames mutableCopy];
    [allnames removeAllObjects];
    
    allnames =[ciiiii mutableCopy];
    allkeys=[[allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    //NSLog(@"*******%@***********",allnames);
    [tableview reloadData];
    searchbar.showsCancelButton=NO;
    */
    
}
//当搜索栏上改变的时候
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    searchbar.showsCancelButton=YES;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return allkeys.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *string=allkeys[section];
    NSArray *array=[allnames objectForKey:string];
    return array.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    NSString *str=allkeys[indexPath.section];
    NSArray *array=[allnames objectForKey:str];
    ZKZPerson *p=array[indexPath.row];
    cell.textLabel.text=p.name;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    //NSLog(@"p.name=%@",p.name);
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return allkeys[section];
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return allkeys;
}
//详细联系人入口
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexp=indexPath;
    //NSLog(@"更新联系人入口");
    DetilViewController *detil=[[DetilViewController alloc]init];
    NSString *str=allkeys[indexPath.section];
    NSArray *array=[allnames objectForKey:str];
    detil.p1=array[indexPath.row];
    [self.navigationController pushViewController:detil animated:NO];
    
}
-(void)addtap:(UIBarButtonItem *)sender
{
    AddViewController *add=[[AddViewController alloc]init];
    add.delegate=self;
    [self.navigationController pushViewController:add animated:YES];
}
- (NSString *) phonetic:(NSString*)sourceString
{
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}

//实现增加联系人协议
-(void)PassvalueName:(NSString *)_name andWith:(NSString *)_tel
{
    ZKZPerson *person=[[ZKZPerson alloc]init];
    person.name=_name;
    person.tel=_tel;
    NSString *str=[self phonetic:_name];
    
    NSString *str1=[[str substringToIndex:1]uppercaseString];
    //str1 uppercaseString
    NSMutableArray *array=[allnames objectForKey:str1];
    if (array==nil)
    {
        array=[[NSMutableArray alloc]init];
    }
    [array addObject:person];
    [allnames setObject:array forKey:str1];
    [NSKeyedArchiver archiveRootObject:allnames toFile:path];
    //NSLog(@"allnames=...%@",allnames);
    allkeys=[allnames allKeys];
    //每次进来的键都需要从新排名－－－－－－－－－－－》
    allkeys=[allkeys sortedArrayUsingSelector:@selector(compare:)];
    //NSLog(@"%@",allkeys);
   
    [tableview reloadData];
    //NSLog(@"........");
    
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
