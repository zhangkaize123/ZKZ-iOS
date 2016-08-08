//
//  ViewController.m
//  集合视图练习题
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
    array=[[NSMutableArray alloc]init];
    for (int i=0; i<100; i++)
    {
        [array addObject:@"1"];
        NSLog(@"%@",array);
    }
    //流式布局
    UICollectionViewFlowLayout *cvf=[[UICollectionViewFlowLayout alloc]init];
    cvf.itemSize=CGSizeMake(98, 98);
    cvf.sectionInset=UIEdgeInsetsMake(20, 1, 5, 1);
    //创建集合视图
    UICollectionView *collectview=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:cvf];
    collectview.backgroundColor=[UIColor redColor];
    [self.view addSubview:collectview];
    //注册一个单元格
    [collectview registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
    collectview.delegate=self;
    collectview.dataSource=self;
//
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor orangeColor];
    UIImageView *i1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    i1.image=[UIImage imageNamed:@"2.png"];
    
    [cell addSubview:i1];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *s1=[NSString stringWithFormat:@"%d",(int)indexPath.item];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TEST" object:s1];
    NSLog(@"s1=====%@",s1);
    TestViewController *test=[[TestViewController alloc]init];
    //以为没有创建导航栏控制器所以没有出现推出界面。——————————————》
    //[self.navigationController pushViewController:test animated:YES];
    [self presentViewController:test animated:YES completion:nil];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
