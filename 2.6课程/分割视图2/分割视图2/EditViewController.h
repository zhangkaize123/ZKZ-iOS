//
//  EditViewController.h
//  分割视图2
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *editText;
    
}
@property(strong,nonatomic)NSString *onename;
@end
