//
//  MainViewController.h
//  转屏练习
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *collectionview;
    UIDeviceOrientation dict;
    UICollectionViewFlowLayout *cvf;
}
@end
