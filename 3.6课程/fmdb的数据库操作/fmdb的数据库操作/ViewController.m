//
//  ViewController.m
//  fmdb的数据库操作
//
//  Created by 张凯泽 on 15-3-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "FMDatabase.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak, nonatomic) IBOutlet UITextField *pass;
- (IBAction)okTap:(UIButton *)sender;
- (IBAction)showTap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *showTextview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)okTap:(UIButton *)sender {
    NSString *name=self.user.text;
    NSString *pass=self.pass.text;
    //获得应用的代理－－－－》AppDelegate
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    //添加数据
    BOOL b=[db executeUpdate:@"insert into t_user values (?,?)",name,pass];
    if (!b) {
        NSLog(@"添加失败");
    }
    
}

- (IBAction)showTap:(UIButton *)sender {
    //对文本框进行删除
    self.showTextview.text=@"";
    //导入应用代理
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    //创建数据库对象
    FMDatabase *db=app.db;
    //通过用户名来查找密码
    
    FMResultSet *set=[db executeQuery:@"select * from t_user"];
    //调用 [set next]方法
        while ([set next]) {
        NSString *uname=[set stringForColumnIndex:0];
        NSString *upass=[set stringForColumnIndex:1];
            
            //self.showTextview.text=[NSString stringWithFormat:@"%@%@%@\r\n",self.showTextview.text,uname,upass];
            NSLog(@"%@***%@",uname,upass);
    }
    [set close];
    
    
}
@end
