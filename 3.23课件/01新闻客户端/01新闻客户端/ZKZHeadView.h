//
//  ZKZHeadView.h
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZKZHeadViewdelegate <NSObject>
@optional
-(void)sendButtonName:(NSString *)buttonName andName:(NSArray *)array;
@end
@interface ZKZHeadView : UIView
@property(nonatomic,weak)id <ZKZHeadViewdelegate>delegate;
+(instancetype)loadView;
@end
