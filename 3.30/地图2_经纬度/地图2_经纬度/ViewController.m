//
//  ViewController.m
//  地图2_经纬度
//
//  Created by 张凯泽 on 15-3-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager=[[CLLocationManager alloc]init];//创建位置管理器的对象。
    //设置代理
    self.locationManager.delegate=self;
    //设置精度
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    //每隔一百米测试一次
    self.locationManager.distanceFilter=100;
    //认证
    //如果iOS是8.0版本以上
    if ([[UIDevice currentDevice] systemVersion].doubleValue>8.0) {
        //位置管理对象中有requestAlwaysAuthorization
        if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [self.locationManager requestAlwaysAuthorization];
        }
    }
    //启动
    [self.locationManager startUpdatingLocation];
    
}
//获得位置
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // NSLog(@"获得位置成功---%@---",locations);
    [self.locationManager stopUpdatingLocation];
    CLLocation *current=locations.lastObject;
    NSLog(@"纬度＝%g\u00b0",current.coordinate.latitude);//纬度
    NSLog(@"经度＝%g\u00b0",current.coordinate.longitude);//经度
    NSLog(@"水平精度＝%g",current.horizontalAccuracy);//水平精度
    NSLog(@"垂直精度＝%g",current.verticalAccuracy);//垂直精度
    NSLog(@"海拔＝%g",current.altitude);//海拔
    NSLog(@"距离＝%g",[current distanceFromLocation:current]);//距离
    
}
//获得失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"获得位置失败");
}

@end
