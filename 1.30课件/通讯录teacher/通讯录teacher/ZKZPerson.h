//
//  ZKZPerson.h
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKZPerson : NSObject<NSCoding,NSCopying>
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *tel;

@end
