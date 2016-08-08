//
//  ViewController.h
//  日历
//
//  Created by wyzc on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSMutableArray * years;
    NSMutableArray * months;
    NSMutableArray * days;
}
@end

