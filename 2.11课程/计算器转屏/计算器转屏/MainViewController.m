//
//  MainViewController.m
//  计算器转屏
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    NSArray * titles;
    NSArray * colors;
    
}
@end

@implementation MainViewController

-(void)dictchange
{
    UIDeviceOrientation dict=[[UIDevice currentDevice]orientation];
    if (dict==1)
    {
        [v3 removeFromSuperview];
        [v2 removeFromSuperview];
        //显示视图
        v1=[[UIView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:v1];
        UILabel *showlable=[[UILabel alloc]init];
        [v1 addSubview:showlable];
//        [showlable setFrame:CGRectMake(1, 22, self.view.frame.size.width-2, self.view.frame.size.height/7*2)];
        showlable.frame=CGRectMake(1, 22, self.view.frame.size.width-2, self.view.frame.size.height/7*2);
        
        float x=1;
        float y=22+self.view.frame.size.height/7*2;
        //每个按钮的宽度和高度
        float width=(self.view.frame.size.width-5)/4;
        float height=(self.view.frame.size.height-y-6)/5;
        for(int i=0;i<5;i++)//行
        {
            for(int j=0;j<4;j++)//列
            {
                 UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(x+(width+1)*j, y+(height+1)*i, width, height)];
                
                if(j+4*i==17)
                {
                    btn.frame=CGRectMake(x, y+(height+1)*i, width*2+1, height);
                }
                [btn setTitle:titles[j+4*i] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                btn.backgroundColor=colors[j+4*i];
                //btn.backgroundColor=[UIColor redColor];
                [v1 addSubview:btn];
            }
        }
        
    }
    else if (dict==3)
    {
        [v3 removeFromSuperview];
        [v1 removeFromSuperview];
        //显示视图
        v2=[[UIView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:v2];
        UILabel *showlable=[[UILabel alloc]init];
        showlable.backgroundColor=[UIColor blackColor];
        [v2 addSubview:showlable];

        [showlable setFrame:CGRectMake(1, 22, self.view.frame.size.width-2, self.view.frame.size.height/7*2)];
        

        
        float x=1;
        float y=22+self.view.frame.size.height/7*2;
        //每个按钮的宽度和高度
        float width=(self.view.frame.size.width-5)/4;
        float height=(self.view.frame.size.height-y-6)/5;
        for (int i=0; i<5; i++)
        {
            for (int j=0; j<4; j++)
            {
                UIButton *b1=[[UIButton alloc]initWithFrame:CGRectMake(x+(width+1)*j,y+(height+1)*i, width, height)];
                
                if(j+4*i==17)
                {
                    b1.frame=CGRectMake(x, y+(height+1)*i, width*2+1, height);
                }
                [b1 setTitle:titles[j+4*i] forState:UIControlStateNormal];
                [b1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                b1.backgroundColor=colors[j+4*i];
                //b1.backgroundColor=[UIColor redColor];
                [v2 addSubview:b1];
            }
            
        }

    }
    else if (dict==4)
    {
        [v2 removeFromSuperview];
        [v1 removeFromSuperview];
        //显示视图
        v3=[[UIView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:v3];
        UILabel *showlable=[[UILabel alloc]init];
        showlable.backgroundColor=[UIColor blackColor];
        [v3 addSubview:showlable];
        
        [showlable setFrame:CGRectMake(1, 22, self.view.frame.size.width-2, self.view.frame.size.height/7*2)];
        float x=1;
        float y=22+self.view.frame.size.height/7*2;
        //每个按钮的宽度和高度
        float width=(self.view.frame.size.width-5)/4;
        float height=(self.view.frame.size.height-y-6)/5;
        for (int i=0; i<5; i++)
        {
            for (int j=0; j<4; j++)
            {
                UIButton *b1=[[UIButton alloc]initWithFrame:CGRectMake(x+(width+1)*j,y+(height+1)*i, width, height)];
                
                if(j+4*i==17)
                {
                    b1.frame=CGRectMake(x, y+(height+1)*i, width*2+1, height);
                }
                [b1 setTitle:titles[j+4*i] forState:UIControlStateNormal];
                [b1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                b1.backgroundColor=colors[j+4*i];
                //b1.backgroundColor=[UIColor redColor];
                [v3 addSubview:b1];
            }
            
        }
        
    }

    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dictchange) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    titles=[[NSArray alloc]initWithObjects:
            @"C",@"+/-",@"%",@"➗",
            @"7",@"8",@"9",@"X",
            @"4",@"5",@"6",@"-",
            @"1",@"2",@"3",@"+",
            @"0",@"0",@".",@"=",
            nil];
    colors=[[NSArray alloc]initWithObjects:
            [UIColor grayColor],[UIColor grayColor],[UIColor grayColor],[UIColor orangeColor],
            [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
            [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
            [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
            [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],nil];
    
    
    

    
    // Do any additional setup after loading the view.
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
