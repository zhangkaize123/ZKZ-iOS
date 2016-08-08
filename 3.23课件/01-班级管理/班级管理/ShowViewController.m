//
//  ShowViewController.m
//  班级管理
//
//  Created by 张凯泽 on 15-3-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ShowViewController.h"
#import "ZKZClassInfo.h"
#import "AddViewController.h"
#import "ZKZEditViewController.h"
@interface ShowViewController ()<UITableViewDataSource,UITableViewDelegate,AddViewControllerdelegate>
{
    UITableView *tableView;
}
@property(nonatomic,strong)NSMutableArray *classes;
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(delInfo:) name:@"DELETE" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateInfo:) name:@"UPDATE" object:nil];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=[NSString stringWithFormat:@"用户名是：%@",self.sendname];
    //导航栏右边按钮
    UIBarButtonItem * bbi=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTap:)];
    self.navigationItem.rightBarButtonItem=bbi;
   tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    //设置约束
    tableView.autoresizingMask=UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//指定代理和数据源
    tableView.delegate=self;
    tableView.dataSource=self;
    
    
}
#pragma mark-----tableview的数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%d",self.classes.count);
    return self.classes.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    cell.accessoryType=UITableViewCellStateShowingEditControlMask;
    ZKZClassInfo *info=[self.classes objectAtIndex:indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"班级的名字是:%@",info.name];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@%d",@"对应的键是:",info.number];
    return cell;
}
#pragma mark-----tableview代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    ZKZClassInfo *info=[self.classes objectAtIndex:indexPath.row];
    NSLog(@"%@",info.name);
    ZKZEditViewController *edit=[[ZKZEditViewController alloc]init];
    edit.sendclass=info.name;
    edit.senduser=_sendname;
    edit.keyId=info.number;
    edit.numberStr=[NSString stringWithFormat:@"%d",info.number];
    [self.navigationController pushViewController:edit animated:YES];
    
}
#pragma  mark----addviewcontroller代理方法
-(void)sendValueWith:(ZKZClassInfo*)classInfo
{
    [self.classes addObject:classInfo];
    //NSLog(@"______%@_____",self.classes);
    [tableView reloadData];
    
}

#pragma  mark----通知的实现方法
-(void)delInfo:(id)obj
{
    
    NSString *string=[obj object];
    for (ZKZClassInfo*class in self.classes) {
        if ([class.name isEqualToString:string]) {
            [self.classes removeObject:class];
            break;
        }
    }
    
    
    [tableView reloadData];
}
-(void)updateInfo:(id)obj
{
    
    NSString *string=[obj object];
    NSArray *array=[string componentsSeparatedByString:@","];
    int a=[array[0]intValue];
    
    for (ZKZClassInfo*class in self.classes) {
        if (class.number==a) {
            class.name=array[1];
            break;
        }
    }
    [tableView reloadData];
}

#pragma mark----增加按钮的方法
-(void)addTap:(UIBarButtonItem *)sender
{
    AddViewController *add=[[AddViewController alloc]init];
    add.delegate=self;
    add.senduser=self.sendname;
    [self.navigationController pushViewController:add animated:YES];
    
}
#pragma mark------重写set方法
-(void)setSendname:(NSString *)sendname
{
    _sendname=sendname;
}

#pragma mark----读取数据
-(NSMutableArray *)classes
{
    if (_classes==nil)
    {
        NSString *string=[NSString stringWithFormat:@"http://127.0.0.1/zkz/bjmr_ios.php?id=%@",self.sendname];
        NSURL *url=[NSURL URLWithString:string];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSLog(@"%@",data);
        if (data)
        {
            NSMutableArray *temp=[NSMutableArray array];
            NSArray *array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            for (NSDictionary * dic in array)
            {
                ZKZClassInfo *info=[[ZKZClassInfo alloc]init];
                info.name=[dic objectForKey:@"name"];
                info.userid=[dic objectForKey:@"userid"];
                info.number=[[dic objectForKey:@"id"]intValue];
                [temp addObject:info];
            }
            _classes=temp;
        }
    }
    return _classes;
}

@end
