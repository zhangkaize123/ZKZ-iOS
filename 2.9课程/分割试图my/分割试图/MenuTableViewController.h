//
//  MenuTableViewController.h
//  分割试图
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetilViewController.h"
@interface MenuTableViewController : UITableViewController<UIAlertViewDelegate>
{
    
}
@property(strong,nonatomic)NSString*name;
@property(strong,nonatomic)NSMutableArray*names;
@property(strong,nonatomic)DetilViewController *d;
@end
