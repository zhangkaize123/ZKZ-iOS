//
//  DetailViewController.h
//  通讯录
//
//  Created by wyzc on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHQPerson.h"
#import "ServiceDelegate.h"
@interface DetailViewController : UIViewController<ServiceDelegate>
{
    UILabel * nameLabel;
    UILabel * numberLabel;
}
@property (strong,nonatomic) ZHQPerson * person;
@end
