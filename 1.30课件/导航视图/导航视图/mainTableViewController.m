//
//  mainTableViewController.m
//  导航视图
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "mainTableViewController.h"
#import "MainViewController.h"
@interface mainTableViewController ()

@end

@implementation mainTableViewController

- (void)viewDidLoad
{
    
    self.names=[[NSMutableArray alloc]init];
    //self.title=@"主界面";
    for (int i=0; i<10; i++)
    {
        int a=arc4random()%26;
        a=a+'a';
        int b=arc4random()%26;
        b=b+'a';
        int c=arc4random()%26;
        c=c+'a';
        int d=arc4random()%26;
        d=d+'a';
        int e=arc4random()%26;
        e=e+'a';
        [self.names addObject:[NSString stringWithFormat:@"%c%c%c%c%c",a,b,c,d,e]];
        
    }
    //导航栏显示分段栏
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"1",@"2",@"3", nil]];
    //seg.frame=CGRectMake(0, 64, 200, 40);
    //[self.view addSubview:seg];
    self.navigationItem.titleView=seg;
    //导航栏显示➕;
    UIBarButtonItem *b=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addtag:)];
    self.navigationItem.rightBarButtonItem=b;
    
    
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//导航栏右侧➕行为
-(void)addtag:(UIBarButtonItem *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.names.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    
    cell.textLabel.text=self.names[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


//单元格右侧进入另外一个界面行为
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    index=indexPath;//other-->main
    MainViewController *other=[[MainViewController alloc]init];
    [self.navigationController pushViewController:other animated:YES];
    //main-->other
    other.sendother=self.names[indexPath.row];
    //要想从other－－－－》main必须把other.main=self;
    other.main=self;
    
}
-(void)setUpdate:(NSString *)update
{
    self.names[index.row]=update;
    //UITableViewCell * cell=[self.tableView cellForRowAtIndexPath:index];
    //＊＊＊＊＊8*＊＊＊＊＊＊＊＊指定单元格更新。＊＊＊＊＊＊＊＊＊＊＊＊＊
    UITableViewCell * cell=[self.tableView cellForRowAtIndexPath:index];
    cell.textLabel.text=update;
}


//-(void)viewWillAppear:(BOOL)animated
//{
//    NSLog(@"将要出现");
//}
//-(void)viewDidAppear:(BOOL)animated
//{
//    NSLog(@"已经出现");
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    NSLog(@"将要消失");
//}
//-(void)viewDidDisappear:(BOOL)animated
//{
//    NSLog(@"已经消失");
//}
//隐藏状态栏
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleDefault;
//}
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

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
