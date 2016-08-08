//
//  AddViewController.h
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passvalue
-(void)PassvalueName:(NSString *)_name andWith:(NSString *)_tel;
@end
@interface AddViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *nametext;
    UITextField *teltext;
    UIBarButtonItem *right;
   
}
@property (strong,nonatomic)id< passvalue>delegate;
@end
