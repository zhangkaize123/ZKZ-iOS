//
//  MenuTableViewController.h
//  分割视图2
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewController : UITableViewController<UIActionSheetDelegate,UIAlertViewDelegate>
{
    NSIndexPath *indexp;
    NSIndexPath *p;
    NSMutableArray *savenames;
    NSString *path;
}
@property(strong,nonatomic)NSMutableArray *allnames;
@end
