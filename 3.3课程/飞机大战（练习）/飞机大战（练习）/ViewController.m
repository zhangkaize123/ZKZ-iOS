//
//  ViewController.m
//  飞机大战（练习）
//
//  Created by 张凯泽 on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
/*
 
＊＊＊＊＊＊＊＊ mainView.enemys 可以实现这个数组的重复利用；
 
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainView=[[MainView alloc]init];
    self.view=mainView;
    self.view.backgroundColor=[UIColor whiteColor];
    //创建定时器
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}
/**定时器方法*/
-(void)timer
{
    static int count=0;
    count++;
    if (count==5) {
    static BOOL flag;
    int i = 0;
        //创建敌人
        ZKZSprite *enemySprite=[[ZKZSprite alloc]init];
        //创建敌人坐标。
        int x=self.view.frame.size.width;
        int spriteX=arc4random()%(x-39);
        int spriteY=-20;
        enemySprite.spritePoint=CGPointMake(spriteX, spriteY);
        //添加到数组中去
    if (mainView.enemys!=nil) {
        for (i=0;i<mainView.enemys.count;i++) {
            ZKZSprite *s=[mainView.enemys objectAtIndex:i];
            if (s.isUsed==YES) {
                flag=YES;
                break;
            }
        }
    }
    if (flag==NO) {
        [mainView.enemys addObject:enemySprite];
    }else{
        [mainView.enemys replaceObjectAtIndex:i withObject:enemySprite];
    }
        count=0;
    }
    //刷屏
    [self.view setNeedsDisplay];
    
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
