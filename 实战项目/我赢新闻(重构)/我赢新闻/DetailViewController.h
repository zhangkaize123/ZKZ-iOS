//
//  DetailViewController.h
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-28.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHQNews.h"
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentText;
@property (weak, nonatomic)  ZHQNews *news;
@end
