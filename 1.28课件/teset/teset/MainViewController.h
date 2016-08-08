//
//  MainViewController.h
//  teset
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OtherViewController.h"
@interface MainViewController : UIViewController<passValue>
{
    UITextField *text;
}
@property(strong,nonatomic)NSString *mainstring;
@end
