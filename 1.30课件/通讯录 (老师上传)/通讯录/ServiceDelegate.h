//
//  ServiceDelegate.h
//  通讯录
//
//  Created by wyzc on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceDelegate <NSObject>
-(void)passValueWithName:(NSString *)name andWithTel:(NSString *)tel;
@end
