//
//  ViewController.m
//  集合视图
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    array=[[NSMutableArray alloc]init];
    self.view.backgroundColor=[UIColor whiteColor];
    for (int i=0; i<99; i++)
    {
        NSString * str=[NSString stringWithFormat:@"name%02d",i+1];
        [array addObject:str];
        NSLog(@"%@",array);
    }
    //创建流式布局
    UICollectionViewFlowLayout *cvf=[[UICollectionViewFlowLayout alloc]init];
    //设定单元大小
    cvf.itemSize=CGSizeMake(145, 98);
    //设定集合视图离上下左右的距离
    cvf.sectionInset=UIEdgeInsetsMake(20, 2, 5, 2);
    //创建集合视图
    UICollectionView *cllectionview=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:cvf];
    //设置代理
    cllectionview.delegate=self;
    cllectionview.dataSource=self;
    //注册一个集合单元。
    [cllectionview registerClass:[CollectionViewCell class]  forCellWithReuseIdentifier:@"mycell"];
    [self.view addSubview:cllectionview];
    [super viewDidLoad];
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
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor lightGrayColor];
    UIImageView *i2=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 98, 98)];
    i2.image=[UIImage imageNamed:@"3.png"];
    [cell addSubview:i2];
    
        return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
