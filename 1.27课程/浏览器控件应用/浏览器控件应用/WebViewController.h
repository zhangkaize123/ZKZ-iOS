//
//  WebViewController.h
//  浏览器控件应用
//
//  Created by 张凯泽 on 16/3/1.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
{
    UIView *v;
}
@property(nonatomic,copy)NSString *urlStr;

@end
