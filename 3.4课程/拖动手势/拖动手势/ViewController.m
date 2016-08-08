//
//  ViewController.m
//  拖动手势
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *segment;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //拖拽
    UIPanGestureRecognizer *pgr=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(onPan:)];
    [self.segment addGestureRecognizer:pgr];
}
-(void)onPan:(UIPanGestureRecognizer *)recognizer
{
    //得到当前点
    CGPoint point=[recognizer translationInView:recognizer.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
    //让控件的点坐标加上那个点的距离
    self.segment.center=CGPointMake(self.segment.center.x+point.x, self.segment.center.y+point.y);
   // NSLog(@"___________%@",NSStringFromCGPoint(self.segment.center));
    //设置手势坐标为零
    [recognizer setTranslation:CGPointZero inView:self.view];
}


@end
