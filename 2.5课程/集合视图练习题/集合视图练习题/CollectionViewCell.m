//
//  CollectionViewCell.m
//  集合视图练习题
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.lable=[[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width-40)/2, 70, 40, 10)];
        self.lable.text=@"1";
        self.lable.backgroundColor=[UIColor greenColor];
        [self addSubview:self.lable];
        
    }
    return self;
}
@end
