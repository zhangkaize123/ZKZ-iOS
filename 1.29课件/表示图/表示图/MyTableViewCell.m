//
//  MyTableViewCell.m
//  表示图
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell
@synthesize inputext,button;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self!=nil)
    {
        self.backgroundColor=[UIColor orangeColor];
        inputext=[[UITextField alloc]initWithFrame:CGRectMake(5, 10, 150, 40)];
        inputext.backgroundColor=[UIColor lightGrayColor];
        //[self addSubview:inputext];
        button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
        [button setTitle:@"OK" forState:UIControlStateNormal];
        button.userInteractionEnabled=NO;
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(oktag:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}
-(void)oktag:(UIButton *)sender
{
    NSLog(@"%@",inputext.text);
}






- (void)awakeFromNib
{
    
    
    
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
