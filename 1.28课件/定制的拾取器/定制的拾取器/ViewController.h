//
//  ViewController.h
//  定制的拾取器
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property(strong,nonatomic)NSArray *sexs;
 @property(strong,nonatomic)NSArray *names;


@end

