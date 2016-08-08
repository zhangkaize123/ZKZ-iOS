//
//  ViewController.h
//  地图2_经纬度
//
//  Created by 张凯泽 on 15-3-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;//位置管理器

@end

