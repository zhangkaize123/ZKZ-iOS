//
//  ZHQPerson.h
//  通讯录
//
//  Created by wyzc on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHQPerson : NSObject<NSCoding,NSCopying>
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * tel;
@property (strong,nonatomic) NSString * pinyin;
@end
