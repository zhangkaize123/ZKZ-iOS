//
//  RegisterViewController.m
//  即时通讯框架
//
//  Created by 张凯泽 on 16/2/17.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
- (IBAction)finishClick;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.passWord isExclusiveTouch]) {
        [self.passWord resignFirstResponder];
    }
    if (![self.userName isExclusiveTouch]) {
        [self.userName resignFirstResponder];
    }
}

- (IBAction)finishClick {
    //1.推出键盘操作
    if (![self.passWord isExclusiveTouch]) {
        [self.passWord resignFirstResponder];
    }
    if (![self.userName isExclusiveTouch]) {
        [self.userName resignFirstResponder];
    }
    //2.对数据进行验证
    //3.网络测试
     AppDelegate * app=[UIApplication sharedApplication].delegate;
    if(![app connectWithUname:self.userName.text andWithUpas:self.passWord.text andIsLoginOrIsRegister:NO])
    {
        [SVProgressHUD showErrorWithStatus:@"登录失败，请稍后在试！"];
    }
    
}
@end
