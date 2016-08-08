//
//  MainTableViewController.h
//  通讯录
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController<UIActionSheetDelegate,UISearchBarDelegate>
{
    NSString *keypath;
    NSString*namepath;
    NSIndexPath *p;
    NSIndexPath *repairp;
    UISearchBar *search;
}
@property(strong,nonatomic)NSMutableDictionary *allnames;
@property(strong,nonatomic)NSMutableSet *allkeys;
@property(strong,nonatomic)NSString*addname;
@property(strong,nonatomic)NSString*addphone;
@property(strong,nonatomic)NSMutableDictionary *currentnames;
@property(strong,nonatomic)NSString*repairn;
@property(strong,nonatomic)NSString*repairp;//未用

@end
