//
//  ONETableViewController.m
//  我赢新闻
//
//  Created by wyzc on 15-4-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ONETableViewController.h"
#import "Reachability.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "ZHQAlert.h"
#import "ZHQNews.h"
#define HOSTNAME @"http://115.159.1.248:56666/xinwen/"
@interface ONETableViewController ()

@end

@implementation ONETableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    flId=1;
    CGRect rect=self.view.frame;
    float width=rect.size.width;
    self.news=[[NSMutableArray alloc]init];
    //导航栏上的分类
    scrollView=[[HScrollView alloc]init];
    scrollView.frame=CGRectMake(0, 20, width, 44);
    //新闻按钮
    UIButton * btnXinwen=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnXinwen setTitle:@"新闻" forState:UIControlStateNormal];
    [btnXinwen setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnXinwen.tag=1;
    [btnXinwen addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnXinwen];
    //国内按钮
    UIButton * btnGuonei=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnGuonei setTitle:@"国内" forState:UIControlStateNormal];
    //btnGuonei.backgroundColor=[UIColor grayColor];
    [btnGuonei setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnGuonei.tag=2;
    [btnGuonei addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView  addButton:btnGuonei];
    //国际按钮
    UIButton * btnGuoji=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnGuoji setTitle:@"国际" forState:UIControlStateNormal];
    [btnGuoji setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnGuoji.tag=3;
    [btnGuoji addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnGuoji];
    //社会按钮
    UIButton * btnShehui=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnShehui setTitle:@"社会" forState:UIControlStateNormal];
    [btnShehui setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnShehui.tag=4;
    [btnShehui addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnShehui];
    //公益按钮
    UIButton * btnGongyi=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [btnGongyi setTitle:@"公益" forState:UIControlStateNormal];
    [btnGongyi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnGongyi.tag=5;
    [btnGongyi addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addButton:btnGongyi];
    
    self.navigationItem.titleView=scrollView;
    //加载数据
    [self loadData];
}
-(void)loadData
{
    //提示加载
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeBlack];
    Reachability * reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    if([reach currentReachabilityStatus]==0)//没有网络
    {
        [self loadDataWithLocal];//从本地数据库中显示数据
    }
    else
    {
        [self loadDataWithNetwork];//从远程加载数据
    }
}
-(void)loadDataWithNetwork//通过网络加载数据
{
    //清空集合
    [self.news removeAllObjects];
    //得到数据库对象
    AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    NSString * strUrl=[NSString stringWithFormat:@"%@getnews.php?id=%d",HOSTNAME,flId];
    NSString * sql=[NSString stringWithFormat:@"delete from news where flid=%d",flId];
    //清除数据库中保存的数据
    [db executeUpdate:sql];
    NSURL * url=[NSURL URLWithString:strUrl];
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
    NSError * err;
    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    if(data!=nil)
    {
        //对数据进行json解析
        NSArray * news=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if(news==nil)//返回的数据无效
        {
            [ZHQAlert alert:@"新闻加载失败，请稍后再试！"];
            [SVProgressHUD dismiss];
            return;
        }
        if([news count]>0)//有新闻
        {
            for(NSDictionary * dict in news)//遍历每个新闻
            {
                NSArray * keys=[dict allKeys];
                ZHQNews * xinwen=[[ZHQNews alloc]init];
                for(NSString * str in keys)
                {
                    //对对象的属性一一賦值kvc
                    [xinwen setValue:[dict objectForKey:str] forKey:str];
                }
                //下载图片
                NSString * imgName=[NSString stringWithFormat:@"%@images/%@",HOSTNAME,xinwen.picture];
                NSURL * url=[NSURL URLWithString:imgName];
                NSURLRequest * request=[NSURLRequest requestWithURL:url];
                NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                xinwen.img=[UIImage imageWithData:data];
                [self.news addObject:xinwen];
                //把数据写入数据库
                BOOL b=[db executeUpdate:@"insert into news(idid,title,subtitle,picture,content,author,flid,time,clicks,pic) values(?,?,?,?,?,?,?,?,?,?)",xinwen.idid,xinwen.title,xinwen.subtitle,xinwen.picture,xinwen.content,xinwen.author,xinwen.flid,xinwen.time,xinwen.clicks,data];
                if(!b)
                {
                    [ZHQAlert alert:@"数据本地保存失败！"];
                }
            }
        }
        [self.tableView reloadData];
    }
    else
    {
        [ZHQAlert alert:@"新闻加载失败，请稍后再试！"];
    }
    [SVProgressHUD dismiss];
}
-(void)loadDataWithLocal//通过本地加载数据
{
    //清空集合
    [self.news removeAllObjects];
    //获得数据库对象
    AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    NSString * sql=[NSString stringWithFormat:@"select * from news where flid=%d",flId];
    FMResultSet * rs=[db executeQuery:sql];
    while ([rs next])
    {
        ZHQNews * news=[[ZHQNews alloc]init];
        news.title=[rs stringForColumn:@"title"];
        news.subtitle=[rs stringForColumn:@"subtitle"];
        news.idid=[NSNumber numberWithInt:[rs intForColumn:@"idid"]];
        news.picture=[rs stringForColumn:@"picture"];
        news.content=[rs stringForColumn:@"content"];
        news.author=[rs stringForColumn:@"author"];
        news.time=[rs stringForColumn:@"time"];
        news.flid=[NSNumber numberWithInt:[rs intForColumn:@"flid"]];
        news.clicks=[NSNumber numberWithInt:[rs intForColumn:@"clicks"]];
        NSData * data=[rs dataNoCopyForColumn:@"pic"];
        news.img=[UIImage imageWithData:data];
        [self.news addObject:news];
    }
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
}
//单击分类按钮
-(void)onTap:(UIButton *)sender
{
    [scrollView clearColor];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    flId=sender.tag;
    //NSLog(@"%d",(int)sender.tag);
    [self loadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
    }
    ZHQNews * news=self.news[indexPath.row];
    cell.imageView.image=news.img;
    cell.textLabel.text=news.title;
    cell.detailTextLabel.text=news.subtitle;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
