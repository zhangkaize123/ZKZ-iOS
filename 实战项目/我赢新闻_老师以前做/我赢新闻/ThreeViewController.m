//
//  ThreeViewController.m
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-28.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import "ThreeViewController.h"
#import "ZHQNews.h"
#import "SVProgressHUD.h"
#import "Reachability.h"
#import "DetailViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"搜索";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.news=[[NSMutableArray alloc]initWithCapacity:100];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        //表格的样式是子标题的样式
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    ZHQNews * news=self.news[indexPath.row];
    //标题
    cell.textLabel.text=news.title;
    //子标题
    cell.detailTextLabel.text=news.subtitle;
    //显示图片
    cell.imageView.image=news.img;
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchTap:(UIButton *)sender {
    [self.news removeAllObjects];
    NSString * str=self.searchText.text;
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(str.length==0)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"你要搜索的内容不能为空！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        self.searchText.text=@"";
        [self.searchText becomeFirstResponder];
        return;
    }
    Reachability * reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    NetworkStatus status=[reach currentReachabilityStatus];
    if(status==NotReachable)//如果没有网络
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有有效的网络连接，无法进行搜索操作！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];

    }
    else//有网络
    {
        
        NSURL * url=[NSURL URLWithString:[NSString stringWithFormat:@"http://127.0.0.1/news/getsearchs.php?content=%@",str]];
        /*
        NSLog(@"12345%@12345",[NSString stringWithFormat:@"http://127.0.0.1/news/getosearchs.php?content=%@",str]);
        */
        NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
        NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        if(data!=nil)
        {
            //对数据进行json解析
            NSArray * news=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            if(news==nil)
            {
                UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"对不起，确实没有找到你要搜索的内容！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
                [alert show];
            }
            if([news count]>0)
            {
                for(NSDictionary * dict in news)
                {
                    NSArray * keys=[dict allKeys];
                    ZHQNews * xinwen=[[ZHQNews alloc]init];
                    for(NSString * str in keys)
                    {
                        //对对象的属性一一賦值kvc
                        [xinwen setValue:[dict objectForKey:str] forKey:str];
                    }
                    NSString * imgName=[NSString stringWithFormat:@"http://127.0.0.1/news/images/%@",xinwen.picture];
                    //NSLog(@"%@",imgName);
                    
                    NSURL * url=[NSURL URLWithString:imgName];
                    NSURLRequest * request=[NSURLRequest requestWithURL:url];
                    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                    xinwen.img=[UIImage imageWithData:data];
                    [self.news addObject:xinwen];
                }
            }
        }
    }
    [self.tableView reloadData];
}
- (IBAction)closeKey:(id)sender {
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detail=[[DetailViewController alloc]initWithNibName:nil bundle:nil];
    detail.news=self.news[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}
@end
