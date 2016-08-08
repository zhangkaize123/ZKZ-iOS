//
//  ViewController.h
//  定制日期选择器
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSInteger row1;
    NSInteger col1;
    UIPickerView *pv;
}
@property(strong,nonatomic)NSMutableArray *moths;
@property(strong,nonatomic)NSMutableArray *years;
@property(strong,nonatomic)NSMutableArray *days;
@end

