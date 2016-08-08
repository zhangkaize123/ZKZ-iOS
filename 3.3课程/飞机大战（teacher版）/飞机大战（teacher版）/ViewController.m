//
//  ViewController.m
//  飞机大战项目
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
/*
 1.判断两个图形有没有交互
 CGRectIntersectsRect(<#CGRect rect1#>, <#CGRect rect2#>)
 2. 触摸事件
 
 3.一个图形在另一控制器中是如何传输数据
 
 */
@interface ViewController ()
{
    int enemycount;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainView=[[MainView alloc]init];
    self.view=mainView;
    self.view.backgroundColor=[UIColor whiteColor];
    prePoint = CGPointZero;
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
}

/**定时器方法实现
 */
-(void)timer:(NSTimer *)timerSender{
    
    static int count=0;
    count++;
    if (count==5) {
        //创建敌人对象
        ZKZSprite *enemySprite=[[ZKZSprite alloc]init];
        int enemyimageW=39;
        int temp=self.view.frame.size.width;
        int pointX=arc4random()%(temp-enemyimageW);
        enemySprite.spritePoint=CGPointMake(pointX, -20);
        enemySprite.isUsed=YES;//有效的
        //把敌人加载到数组
        [mainView.enemys addObject:enemySprite];
        
        //导入英雄对象
        ZKZSprite *hero=mainView.herosprite;
        
        //创建子弹对象
        ZKZSprite *bulletSprite=[[ZKZSprite alloc]init];
        //设置子弹的位置
        bulletSprite.spritePoint=CGPointMake(hero.heroPoint.x+25, hero.heroPoint.y);
        bulletSprite.isUsed=YES;//有效的
        //把子弹加载到数组
        [mainView.bullets addObject:bulletSprite];
       
        count=0;
    }
    //清除某一块区域
    //self.view setNeedsDisplayInRect:;
    //清屏
    [self.view setNeedsDisplay];
    
}

/**触摸事件*/
//触摸开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    //NSLog(@"%@",NSStringFromCGPoint(point));
    prePoint=point;
    ZKZSprite *hero=mainView.herosprite;
    CGPoint heroPoint=hero.heroPoint;
    if ((point.x>=heroPoint.x&&point.x<heroPoint.x+60)&&(point.y>heroPoint.y&&point.y<heroPoint.y+70)) {
        isCover=YES;
    }
    else isCover=NO;
        
    
    
    
}
//触摸移动
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    if (isCover) {
        CGFloat X=point.x-prePoint.x;
        CGFloat Y=point.y-prePoint.y;
        NSLog(@"%g,%g",X,Y);
//        ZKZSprite *hero=mainView.herosprite;
        mainView.herosprite.heroPoint=CGPointMake(mainView.herosprite.heroPoint.x+X, mainView.herosprite.heroPoint.y+Y);
    }
    prePoint = point;
}
//触摸结束
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    isCover=NO;
}
//触摸取消
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    isCover=NO;
}


//隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
