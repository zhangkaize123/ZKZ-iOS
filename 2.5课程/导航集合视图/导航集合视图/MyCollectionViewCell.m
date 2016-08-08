//
//  MyCollectionViewCell.m
//  导航集合视图
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self!=nil)
    {
        self.imageview=[[UIImageView alloc]initWithFrame:CGRectMake((self.frame.size.width-50)/2, 1, 50, 50)];
        [self addSubview:self.imageview];
        self.lable=[[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width-40)/2, 53, 40, 30)];
        [self addSubview:self.lable];
        
    }
    return self;
}
@end
