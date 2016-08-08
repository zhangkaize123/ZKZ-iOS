//
//  ZKZHeadView.m
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZHeadView.h"
#define W [UIScreen mainScreen].bounds.size.width
@interface ZKZHeadView ()
{
    NSArray *array;//按钮文字的数组
}
@property(nonatomic,strong)NSMutableArray *buttons;
@end
@implementation ZKZHeadView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.buttons=[NSMutableArray array];
        //创建滚动视图
        UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        scrollView.scrollEnabled=YES;
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.showsVerticalScrollIndicator=NO;
        [self addSubview:scrollView];
        // 创建按钮的文字
        array=[NSArray arrayWithObjects:@"新闻",@"国内",@"社会",@"公益",@"国际", nil];
        //创建按钮
        CGFloat btnW=100;
        CGFloat btnH=44;
        CGFloat btnY=0;
        CGFloat magin=(W-300)/4;
        for (int i=0; i<5; i++) {
            
            CGFloat btnX=magin+(btnW+magin)*i;
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
            btn.layer.cornerRadius=22;
            
            [btn setTitle:array[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (i==0) {
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                //btn.backgroundColor=[UIColor grayColor];
            }
            //增加点击事件
            [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            //btn.backgroundColor=[UIColor lightGrayColor];
            [scrollView addSubview:btn];
            [self.buttons addObject:btn];
        }
        
        //设计滚动视图的滚动范围
        scrollView.contentSize=CGSizeMake((5*100)+(magin*7), 0);
    }
    return self;
}
+(instancetype)loadView
{
    
    
    //得道屏幕的高度
    //CGFloat height=[UIScreen mainScreen].bounds.size.height;
    ZKZHeadView *headView=[[ZKZHeadView alloc]initWithFrame:CGRectMake(0, 20, W, 44)];
    
    return headView;
}
#pragma mark----点击按钮的方法实现
-(void)click:(UIButton *)sender
{
    for (UIButton *btn in self.buttons) {
        //btn.backgroundColor=[UIColor clearColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    //sender .backgroundColor=[UIColor grayColor];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
      //调用代理方法
    [self.delegate sendButtonName:sender.titleLabel.text andName:array];
}
@end
