//
//  MainViewController.m
//  滚动视图
//
//  Created by 张凯泽 on 15-2-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

/*
 主要学习页视图的字体颜色及选中时的颜色设置－－－－－－－－》
 
 */
#pragma mark - view
- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
    
    
    
    // 创建滚动视图
    scorllview=[[UIScrollView alloc]initWithFrame:self.view.frame];
    scorllview.backgroundColor=[UIColor brownColor];
    [self.view addSubview:scorllview];
    //1.创建图片视图－－－－－－》水瓶滚动
    UIImageView *imageview4=[[UIImageView alloc]initWithFrame:self.view.frame];
    imageview4.image=[UIImage imageNamed:@"1.png"];
    [scorllview addSubview:imageview4];
    UIImageView *imageview5=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageview5.image=[UIImage imageNamed:@"2.png"];
    [scorllview addSubview:imageview5];
    UIImageView *imageview6=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageview6.image=[UIImage imageNamed:@"3.png"];
    [scorllview addSubview:imageview6];
//    //滚动视图设置滚动范围
    scorllview.contentSize=CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    /*
    //2.创建图片视图－－－－－－》垂直滚动
//    UIImageView *imageview1=[[UIImageView alloc]initWithFrame:self.view.frame];
//    imageview1.image=[UIImage imageNamed:@"1.png"];
//    [scorllview addSubview:imageview1];
//    UIImageView *imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
//    imageview2.image=[UIImage imageNamed:@"2.png"];
//    [scorllview addSubview:imageview2];
//    UIImageView *imageview3=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height*2, self.view.frame.size.width, self.view.frame.size.height)];
//    imageview3.image=[UIImage imageNamed:@"3.png"];
//    [scorllview addSubview:imageview3];
//    //滚动视图设置滚动范围
//    scorllview.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3);
     */
    
    
    //按页滚动
    //scorllview.pagingEnabled=YES;
    //关闭水平方向下边的滚动栏显示
    scorllview.showsHorizontalScrollIndicator=NO;
    //关闭垂直下边的滚动栏显示
    //scorllview.showsVerticalScrollIndicator=NO;
    //设定初始页
    scorllview.contentOffset=CGPointMake(self.view.frame.size.width,0 );
    scorllview.delegate=self;
    //页控件//最高是37
   page=[[UIPageControl alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, self.view.frame.size.height-100, 100, 37)];
    page.backgroundColor=[UIColor blackColor];
    page.numberOfPages=3;
    //page.currentPage=
    page.pageIndicatorTintColor=[UIColor redColor];
    page.currentPageIndicatorTintColor=[UIColor blueColor];
    [page addTarget:self action:@selector(valuechange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:page];
    //定时器
    
    //timer1=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timertage:) userInfo:nil repeats:YES];
    //count=0;
    //点击按钮
    UIButton *b1=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-50)/2-50, self.view.frame.size.height-50, 50, 40)];
    b1.backgroundColor=[UIColor greenColor];
    b1.tag=11;
    [b1 setTitle:@"1" forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(onetage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b1];
    UIButton *b2=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-50)/2+5, self.view.frame.size.height-50, 50, 40)];
    b2.backgroundColor=[UIColor greenColor];
    [b2 setTitle:@"2" forState:UIControlStateNormal];
    b2.tag=12;
    [b2 addTarget:self action:@selector(onetage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b2];
    UIButton *b3=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-50)/2+60, self.view.frame.size.height-50, 50, 40)];
    b3.tag=13;
    b3.backgroundColor=[UIColor greenColor];
    [b3 setTitle:@"3" forState:UIControlStateNormal];
    [b3 addTarget:self action:@selector(onetage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b3];
    // Do any additional setup after loading the view.
}
//滚动视图代理行为。
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int indextage=scorllview.contentOffset.x/self.view.frame.size.width;
    
    page.currentPage=indextage;
    
    NSLog(@"%f",scorllview.contentOffset.x);
    //NSLog(@"gundong");
}
//页控件点击事件
-(void)valuechange:(UIPageControl *)sender
{
    scorllview.contentOffset=CGPointMake(self.view.frame.size.width*sender.currentPage, 0);
    NSLog(@"%g",scorllview.contentOffset.x);
}
-(BOOL)prefersStatusBarHidden//隐藏当前状态栏
{
    return YES;
}

- (void)didReceiveMemoryWarning//内存警告
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)timertage:(NSTimer *)sender1
{
    
    count++;
    scorllview.contentOffset=CGPointMake(self.view.frame.size.width*(count%3), 0);
        page.currentPage=count%3;
        
    
    
}
-(void)onetage:(UIButton*)sender
{
    [timer1 invalidate];
    //[sender invalidate];
    
    //UIButton * btn =(UIButton *) [self.view viewWithTag:11];
    if (sender.tag==11)
    {
        scorllview.contentOffset=CGPointMake(self.view.frame.size.width*0, 0);
        page.currentPage=0;
    }
    
    if (sender.tag==12)
    {
        scorllview.contentOffset=CGPointMake(self.view.frame.size.width*1, 0);
        page.currentPage=1;
    }
    if (sender.tag==13)
    {
        scorllview.contentOffset=CGPointMake(self.view.frame.size.width*2, 0);
        page.currentPage=2;
    }

        NSLog(@"zhw****");
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
