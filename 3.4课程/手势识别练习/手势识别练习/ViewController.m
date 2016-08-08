//
//  ViewController.m
//  手势识别练习
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //轻击2下
//    UITapGestureRecognizer *tgr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
//    tgr.numberOfTapsRequired=2;
//    [self.view addGestureRecognizer:tgr];
    //轻击1下
//    UITapGestureRecognizer *tgr1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap1:)];
//        [self.view addGestureRecognizer:tgr1];
//    //当轻击两下失败的时候会调用单机一次的行为
//    [ tgr1 requireGestureRecognizerToFail:tgr];
    //捏合
//    UIPinchGestureRecognizer *pgr=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(onPin:)];
//    [self.view addGestureRecognizer:pgr];
    //滑动
//    UISwipeGestureRecognizer *sgr=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(onSwipe:)];
//    //设定滑动的方向
//    sgr.direction=UISwipeGestureRecognizerDirectionRight;
//    [self.view addGestureRecognizer:sgr];
    //拖拽
//    UIPanGestureRecognizer *pgr=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(onPan:)];
//    [self.btn addGestureRecognizer:pgr];
    //长按
//    UILongPressGestureRecognizer *lpgr=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPress:)];
//    //设置长按的时间间隔
//    lpgr.minimumPressDuration=5;
//    [self.view addGestureRecognizer:lpgr];
}
//-(void)onLongPress:(UILongPressGestureRecognizer *)recognizer
//{
//    if(recognizer.state==UIGestureRecognizerStateBegan)
//    {
//        NSLog(@"长按开始");
//    }
//    if (recognizer.state==UIGestureRecognizerStateEnded) {
//        NSLog(@"长按结束");
//    }
//    
//}
//-(void)onPan:(UIPanGestureRecognizer *)recognizer
//{
//    //得到拖拽的X  Y 的距离
//    CGPoint point=[recognizer translationInView:self.view];
//    //把按钮的中心点的X与Y加上距离
//    CGPoint p=self.btn.center;
//    p.x=p.x+point.x;
//    p.y=p.y+point.y;
//    self.btn.center=p;
//    //设置拖拽点的为0;
//    [recognizer setTranslation:CGPointZero inView:self.view];
//    NSLog(@"拖拽");
//}
//-(void)onSwipe:(UISwipeGestureRecognizer *)recognizer
//{
//    NSLog(@"滑动");
//}

//-(void)onPin:(UIPinchGestureRecognizer *)recognizer
//{
//    NSLog(@"捏合%g",recognizer.scale);
//}
//-(void)onTap:(UITapGestureRecognizer *)recognizer
//{
//    NSLog(@"单机两次");
//}
//-(void)onTap1:(UITapGestureRecognizer *)recognizer
//{
//    NSLog(@"单机一次");
//}
@end
