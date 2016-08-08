//
//  EditViewController.h
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKZPerson.h"
//other---->main协议
@protocol passvalue <NSObject>

-(void)passvalue:(ZKZPerson*)p3;

@end
@interface EditViewController : UIViewController<UITextFieldDelegate,UIActionSheetDelegate>
{
    UITextField *nametext;
    UITextField *teltext;
}
@property(strong,nonatomic)ZKZPerson *p2;
@property(strong,nonatomic)id<passvalue>delegate1;
@end
