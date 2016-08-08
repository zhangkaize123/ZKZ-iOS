//
//  MainViewController.m
//  飞机大战
//
//  Created by wyzc on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "ZHQSprite.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainView=[[MainView alloc]init];
    self.view=mainView;
    self.view.backgroundColor=[UIColor whiteColor];
    prePoint=CGPointZero;
    //定时器
    [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
}
-(void)timer:(NSTimer *)sender
{
    static int count=0;
    count++;//计数
    if(count==5)//够五次
    {
        //产生一个敌人
        ZHQSprite * diren=[[ZHQSprite alloc]init];
        int x=arc4random_uniform(self.view.frame.size.width-30);
        int y=-20;
        diren.position=CGPointMake(x, y);
        diren.isUsed=YES;//有效的
        [mainView.direns addObject:diren];
        //产生一个子弹
        ZHQSprite * zidan=[[ZHQSprite alloc]init];
        zidan.position=CGPointMake(mainView.ncPosition.x+25, mainView.ncPosition.y);
        zidan.isUsed=YES;//有效的
        [mainView.zidans addObject:zidan];
        count=0;
    }
    [self.view setNeedsDisplay];//清屏
}
//触摸开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    prePoint=point;
    int x=mainView.ncPosition.x;
    int y=mainView.ncPosition.y;
    if((point.x>=x && point.x<=x+62) && (point.y>=y && point.y<=y+74))
    {
        //NSLog(@"%@",NSStringFromCGPoint(point));
        isOver=YES;
    }
    else
    {
        isOver=NO;
    }
}
//触摸移动
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    if(isOver)//在飞机上按下
    {
        int x=point.x-prePoint.x;//计算x变化
        int y=point.y-prePoint.y;//计算y变化
        mainView.ncPosition=CGPointMake(mainView.ncPosition.x+x, mainView.ncPosition.y+y);//调整英雄
    }
    prePoint=point;
}
//触摸结束
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    isOver=NO;
}
//触摸取消
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    isOver=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
