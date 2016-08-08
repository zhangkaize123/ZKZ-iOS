//
//  ThreeViewController.h
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-28.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//保存当前分类的所有新闻
@property (strong,nonatomic) NSMutableArray * news;
@property (weak, nonatomic) IBOutlet UITextField *searchText;
- (IBAction)searchTap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)closeKey:(id)sender;

@end
