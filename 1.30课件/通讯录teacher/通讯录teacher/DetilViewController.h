//
//  DetilViewController.h
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKZPerson.h"
#import "EditViewController.h"
@interface DetilViewController : UIViewController<passvalue>
{
    UILabel *namelable;
    UILabel *telable;
}
@property(strong,nonatomic)ZKZPerson *p1;
@end
