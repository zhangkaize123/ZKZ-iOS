//
//  ViewController.h
//  日期
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSMutableArray *years;
    NSMutableArray *months;
    NSMutableArray *days;
    UIPickerView *pv;
}

@end

