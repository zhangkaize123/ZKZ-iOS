//
//  MainTableViewController.m
//  通讯录
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainTableViewController.h"
#import "Add_ViewController.h"
#import "RepairViewController.h"//修改界面
@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    //建立路径
    namepath=[NSHomeDirectory() stringByAppendingPathComponent:@"tel.plist"];
    keypath=[NSHomeDirectory() stringByAppendingPathComponent:@"key.plist"];
    NSLog(@"路径%@",namepath);
    
    self.allnames=[[NSMutableDictionary alloc]initWithContentsOfFile:namepath];
    NSLog(@"allnames=%@",self.allnames);
    NSArray *array5=[self.allnames allKeys];
    //NSLog(@"%@",array5);
    //[self.allkeys addObjectsFromArray:array5];
   self.allkeys=[NSMutableSet setWithArray:array5];
        NSLog(@"allkeys=%@",self.allkeys);
   if (self.allnames==nil)
   {
        self.allnames=[[NSMutableDictionary alloc]initWithCapacity:100];
        self.allkeys=[[NSMutableSet alloc]initWithCapacity:26];
    }
    
    //self.allnames=[[NSMutableDictionary alloc]initWithCapacity:100];
    //self.allkeys=[[NSMutableSet alloc]initWithCapacity:26];
    self.currentnames=[self.allnames mutableCopy];//动态拷贝
    self.title=@"通讯录";
    //增加联系人按钮
    UIBarButtonItem *addbutton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addperson:)];
    self.navigationItem.rightBarButtonItem=addbutton;
    //搜索栏设置
    //search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 10,10 , 10)];
    //self.navigationItem.titleView=search;
    search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    self.tableView.tableHeaderView=search;
    search.delegate=self;
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//增加联系人
-(void)addperson:(UIBarButtonItem *)sender
{
    //NSLog(@"增加联系人");
    Add_ViewController *add=[[Add_ViewController alloc]init];
    add.main=self;
    [self.navigationController pushViewController:add animated:YES];
    
}
-(void)setAddname:(NSString *)addname
{
    NSMutableString *s1=[[NSMutableString alloc]initWithFormat:@"%@",addname];
            if (CFStringTransform((__bridge CFMutableStringRef)s1, 0, kCFStringTransformMandarinLatin, NO))
            {
                
            }
            if (CFStringTransform((__bridge CFMutableStringRef)s1, 0, kCFStringTransformStripDiacritics, NO))
            {
                NSString*str=[s1 substringToIndex:1];
                [self.allkeys addObject:str];
                NSMutableArray *array=[self.allnames objectForKey:str];
                if (array==nil)
                {
                    array=[[NSMutableArray alloc]initWithCapacity:50];
                }
                [array addObject:addname];
                [self.allnames setObject:array forKey:str];
            }
    //张凯泽
    //NSString*str=[addname substringToIndex:1];
    
//    [self.allkeys addObject:str];
//    NSMutableArray *array=[self.allnames objectForKey:str];
//    if (array==nil)
//    {
//        array=[[NSMutableArray alloc]initWithCapacity:50];
//    }
//    [array addObject:addname];
//    [self.allnames setObject:array forKey:str];
    [self.allnames writeToFile:namepath atomically:YES];
    [self.tableView reloadData];
    //NSLog(@"self.allnames=%@",self.allnames);
    //NSLog(@"self.allkeys=%@",self.allkeys);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSArray *key=[self.allnames allKeys];
    //key=[key sortedArrayUsingSelector:@selector(compare:)];
//    NSArray *key=[self.allkeys allObjects];
//    key=[key sortedArrayUsingSelector:@selector(compare:)];
    return key.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSArray *key=[self.allnames allKeys];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    NSArray *array=[self.allnames objectForKey:key[section]];
    //    array=[array sortedArrayUsingSelector:@selector(compare:)];
//    NSArray *key=[self.allkeys allObjects];
//    NSArray *array=[self.allnames objectForKey:key[section]];
//    array=[array sortedArrayUsingSelector:@selector(compare:)];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil)
    {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    NSArray *key=[self.allnames allKeys];
    //NSArray *key=[self.allkeys allObjects];
    //NSLog(@"self.allkeys=%@",self.allkeys);
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    NSArray *array=[self.allnames objectForKey:key[indexPath.section]];
   // array=[array sortedArrayUsingSelector:@selector(compare:)];
    //cell.textLabel.text=array[indexPath.row];
    NSString*str=array[indexPath.row];
    NSArray *array6=[str componentsSeparatedByString:@"-"];
    cell.textLabel.text=array6[0];
    cell.detailTextLabel.text=array6[1];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}
//索引
-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *key=[self.allkeys allObjects];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    
    return key;
}
//设置区头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *key=[self.allnames allKeys];

    //NSArray *key=[self.allkeys allObjects];
    key=[key sortedArrayUsingSelector:@selector(compare:)];
    NSString *title=key[section];
    return title;
}
//删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    p=indexPath;
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
    
    
}
//删除按钮方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
    //
        NSArray *key=[self.allnames allKeys];
        key=[key sortedArrayUsingSelector:@selector(compare:)];
       //NSArray *key= [self.allkeys allObjects];
        NSString *string=key[p.section];
       NSMutableArray *array=(NSMutableArray *) [self.allnames objectForKey:string];
        //NSMutableArray *a=[[NSMutableArray alloc]init];
        
        [array removeObjectAtIndex:p.row];
    }
    
    [self.allnames writeToFile:namepath atomically:YES];
    //self.currentnames=[self.allnames mutableCopy];
    [self.tableView reloadData];
        NSLog(@"self.allnames=%@",self.allnames);
}
//搜索栏
//canclebutton
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    search.showsCancelButton=NO;
    searchBar.text=@"";
    [self.allnames removeAllObjects];
    self.allnames =[self.currentnames mutableCopy];
    //self.currentnames=[self.allnames mutableCopy];
    //NSLog(@"this is cancelbutton");
    [self.tableView reloadData];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    search.showsCancelButton=YES;
    //NSLog(@"textDidChange");
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //提出空格
    self.currentnames=[self.allnames mutableCopy];
    NSString *str=searchBar.text;
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //如何使用模糊查找。
    //NSPredicate *pre=[NSPredicate predicateWithFormat:@"%@",str];
    //NSLog(@"%@",pre);
    NSMutableString *s3=[NSMutableString stringWithFormat:@"%@",str];
    if (CFStringTransform((__bridge CFMutableStringRef)s3, 0, kCFStringTransformMandarinLatin, NO))
    {
        //NSLog(@"Pingying: %@", ms); // wǒ shì zhōng guó rén
    }
    if (CFStringTransform((__bridge CFMutableStringRef)s3, 0, kCFStringTransformStripDiacritics, NO))
    {
        
    }
    NSString *str1=[s3 substringToIndex:1];
//    NSString *str1=[str substringToIndex:1];
    //NSLog(@"%@",str1);
    NSArray *array=[[self.allnames objectForKey:str1]copy];
    NSMutableArray *array1=[[NSMutableArray alloc]init];
    if (str.length>0)
    {
        [array1 removeAllObjects];
        [self.allnames removeAllObjects];
        for (NSString *s in array)
        {
            NSMutableString *s4=[NSMutableString stringWithFormat:@"%@",s];
            if (CFStringTransform((__bridge CFMutableStringRef)s4, 0, kCFStringTransformMandarinLatin, NO))
            {
                //NSLog(@"Pingying: %@", ms); // wǒ shì zhōng guó rén
            }
            if (CFStringTransform((__bridge CFMutableStringRef)s4, 0, kCFStringTransformStripDiacritics, NO))
            {
                
            }

            if ([s4 containsString:str])
            {
                [array1 addObject:s];
                [self.allnames setObject:array1 forKey:str1];
                //NSLog(@"self.allnames=%@",self.allnames);
            }
                            
        }
    }
    [self.tableView reloadData];
   // NSLog(@"searchBarSearchButtonClicked");
}

//修改
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    repairp=indexPath;
    //NSLog(@"这是修改界面");
    RepairViewController *repair=[[RepairViewController alloc]init];
    repair.m=self;
    NSArray *key=[self.allnames allKeys];
    //key=[key sortedArrayUsingSelector:@selector(compare:)];
    //NSArray *key= [self.allkeys allObjects];
    NSString *string=key[indexPath.section];
    NSLog(@"%ld",(long)indexPath.section);
    NSMutableArray *array=(NSMutableArray *) [self.allnames objectForKey:string];
    //把姓名里的电话分离出来
    NSString *str4=array[indexPath.row];
    NSArray *array4=[str4 componentsSeparatedByString:@"-"];
    repair.repairname=array4[0];
    repair.repairphone=array4[1];
    //repair.repairname=array[indexPath.row];
    
    NSLog(@"%@",repair.repairname);
    [self.navigationController pushViewController:repair animated:YES];
}
//修改名字的方法
-(void)setRepairn:(NSString *)repairn
{
    int flag=1;
    NSArray *key=[self.allnames allKeys];
    //key=[key sortedArrayUsingSelector:@selector(compare:)];
    NSString *string=key[repairp.section];
    
    NSMutableString *s2=[NSMutableString stringWithFormat:@"%@",repairn];
            if (CFStringTransform((__bridge CFMutableStringRef)s2, 0, kCFStringTransformMandarinLatin, NO))
            {
                //NSLog(@"Pingying: %@", ms); // wǒ shì zhōng guó rén
            }
            if (CFStringTransform((__bridge CFMutableStringRef)s2, 0, kCFStringTransformStripDiacritics, NO))
            {
                
            }
    NSString *str=[s2 substringToIndex:1];
    NSMutableArray *array=(NSMutableArray *) [self.allnames objectForKey:string];
    NSLog(@"%@",str);
    if ([str isEqualToString:string])
    {
        
        array[repairp.row]=repairn;
    }
    else
    {
        
        
        //判断集合中有没有传过来的关键字。
        
        for(NSString*s6 in[self.allnames allKeys])
        {
            if ([s6 isEqualToString:str])
            {
                NSMutableArray *array1=(NSMutableArray *) [self.allnames objectForKey:str];
                [array1 addObject:repairn];
                [array removeObject:array[repairp.row]];
                flag=2;
            }
            
        }
        if (flag==1)
        {
            [self.allkeys addObject:str];
            NSMutableArray *array=[self.allnames objectForKey:str];
            if (array==nil)
            {
                array=[[NSMutableArray alloc]initWithCapacity:50];
            }
            [array addObject:repairn];
            
            //array[repairp.row]=repairn;
            [self.allnames setObject:array forKey:str];
            //[array removeObject:array[repairp.row]];
        }
        
        
    }
    

    //NSString *str=[repairn substringToIndex:1];
    
     //NSMutableArray *array=(NSMutableArray *) [self.allnames objectForKey:string];
//    if ([str isEqualToString:string])
//    {
//       
//        array[repairp.row]=repairn;
//    }
//    else
//    {
//                NSMutableArray *array1=(NSMutableArray *) [self.allnames objectForKey:str];
//             [array1 addObject:repairn];
//        [array removeObject:array[repairp.row]];
//        
//    }
    
    
//    NSArray *key= [self.allkeys allObjects];
//        //NSArray *key=[self.allnames allKeys];
//   key=[key sortedArrayUsingSelector:@selector(compare:)];
//    NSString *string=key[repairp.section];
//    NSMutableArray *array=(NSMutableArray *) [self.allnames objectForKey:string];
//    array[repairp.row]=repairn;
//    NSLog(@"%@ooooo",self.allnames);
    //[[self.allnames allKeys]sortedArrayUsingSelector:@selector(compare:)];
    [self.tableView reloadData];
    [self.allnames writeToFile:namepath atomically:YES];
    
    
}









/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
