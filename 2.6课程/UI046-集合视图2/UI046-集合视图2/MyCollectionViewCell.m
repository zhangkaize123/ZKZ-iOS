//
//  MyCollectionViewCell.m
//  UI046-集合视图2
//
//  Created by Angle1ove on 2/5/15.
//  Copyright (c) 2015 Angle1ove. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(width / 4, 0, width / 2, width / 2)];
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, width / 2, width, width / 2)];
        [self.label setTextAlignment:NSTextAlignmentCenter];
        [self.label setTextColor:[UIColor redColor]];
        [self.label setFont:[UIFont boldSystemFontOfSize:20]];
        [self addSubview:self.label];
    }
    return self;
}
@end
