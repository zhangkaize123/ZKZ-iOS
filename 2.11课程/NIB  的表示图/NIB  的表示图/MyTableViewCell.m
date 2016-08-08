//
//  MyTableViewCell.m
//  NIB  的表示图
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)okTap:(UIButton *)sender {
    
    self.showLable.text=[NSString stringWithFormat:@"%d",(int)self.selectSeg.selectedSegmentIndex+1];
    
    
    
}
@end
