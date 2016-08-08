//
//  MainViewController.m
//  转屏练习
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "ShowCollectionViewCell.h"
@interface MainViewController ()

@end

@implementation MainViewController
-(void)dicChange
{
    //UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>
       /*
//   UIDeviceOrientation dict=[UIDevice currentDevice].orientation;
//    if (dict==UIDeviceOrientationPortrait)
//    {
//        
//        NSLog(@"竖直%@",NSStringFromCGRect(self.view.frame));
//    }
//    else if(dict==UIDeviceOrientationLandscapeLeft)
//    {
//        NSLog(@"left=%@",NSStringFromCGRect(self.view.frame));
//    }
//        
//    else if(dict==UIDeviceOrientationLandscapeRight)
//    {
//        NSLog(@"right=%@",NSStringFromCGRect(self.view.frame));
//    }
//
//    else if(dict==UIDeviceOrientationPortraitUpsideDown)
//    {
//        NSLog(@"upsidedown=%@",NSStringFromCGRect(self.view.frame));
//    }
//*/
    collectionview.frame=self.view.frame;
     dict=[UIDevice currentDevice].orientation;
    
    if (dict==UIDeviceOrientationPortrait)
    {
        
        NSLog(@"竖向%@",NSStringFromCGRect(self.view.frame));
        cvf.sectionInset=UIEdgeInsetsMake(20, 53, 10, 53);
    }
    else if (dict==UIDeviceOrientationLandscapeLeft)
    {
        
        NSLog(@"左向%@",NSStringFromCGRect(self.view.frame));
        cvf.sectionInset=UIEdgeInsetsMake(20, 80, 10, 80);
    }
//    else if (dict==UIDeviceOrientationLandscapeRight)
//    {
//        
//        NSLog(@"右向%@",NSStringFromCGRect(self.view.frame));
//    }
//    else if (dict==UIDeviceOrientationPortraitUpsideDown)
//    {
//        
//        NSLog(@"倒向%@",NSStringFromCGRect(self.view.frame));
//    }

}

- (void)viewDidLoad

{
    
   // dict=[UIDevice currentDevice].orientation;
    //发送转屏消息
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dicChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    self.view.backgroundColor=[UIColor whiteColor];
    //创建流逝布局
    cvf=[[UICollectionViewFlowLayout alloc]init];
    //设定单元格大小
    cvf.itemSize=CGSizeMake(100, 100);
    //设定集合视图离上下左右的距离
    
//    if (dict==UIDeviceOrientationPortrait)
//    {
//        
//        NSLog(@"竖向%@",NSStringFromCGRect(self.view.frame));
////        cvf.sectionInset=UIEdgeInsetsMake(20, 61, 10, 55);
//    }
//    else if (dict==UIDeviceOrientationLandscapeLeft)
//    {
//        
//        //NSLog(@"左向%@",NSStringFromCGRect(self.view.frame));
//        cvf.sectionInset=UIEdgeInsetsMake(20, 50, 10, 50);
//        
//    }
//
    
    
    //创建集合视图
    collectionview=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:cvf];
    //注册单元格
    [collectionview registerClass:[ShowCollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
    [self.view addSubview:collectionview];
    collectionview.delegate=self;
    collectionview.dataSource=self;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShowCollectionViewCell *showcell=[collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    showcell.backgroundColor=[UIColor orangeColor];
    showcell.autoresizesSubviews=NO;
    return showcell;
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
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
