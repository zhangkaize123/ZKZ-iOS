//
//  ViewController.h
//  分区和索引表示图练习
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UISearchBar*sb;
}
@property(strong,nonatomic)NSMutableDictionary*names;
@property(strong,nonatomic)NSMutableSet *keyname;
@end

