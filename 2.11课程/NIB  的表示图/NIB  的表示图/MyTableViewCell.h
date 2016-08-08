//
//  MyTableViewCell.h
//  NIB  的表示图
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectSeg;

@property (weak, nonatomic) IBOutlet UILabel *showLable;
- (IBAction)okTap:(UIButton *)sender;

@end
