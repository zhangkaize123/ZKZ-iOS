//
//  ScrollViewController.m
//  UI044-模仿APP第一次启动界面
//
//  Created by Angle1ove on 2/4/15.
//  Copyright (c) 2015 Angle1ove. All rights reserved.
//

#import "ScrollViewController.h"
#import "MainViewController.h"
@interface ScrollViewController () <UIScrollViewDelegate>

@end

@implementation ScrollViewController {
    UIScrollView *scrollview;
    UIPageControl *pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    CGFloat width = scrollview.bounds.size.width;
    CGFloat height = scrollview.bounds.size.height;
    
    for (NSInteger i = 1; i <= 5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [imageView setFrame:CGRectMake((i - 1) * width, 0, width, height)];
        [scrollview addSubview:imageView];
    }
    [self.view addSubview:scrollview];
    [scrollview setDelegate:self];
    [scrollview setPagingEnabled:YES];
    [scrollview setBounces:NO];
    [scrollview setShowsHorizontalScrollIndicator:NO];
    [scrollview setContentSize:CGSizeMake(5 * width, height)];
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(width / 2 - 40, height - 80, 80, 40)];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    [pageControl setCurrentPage:0];
    [pageControl setNumberOfPages:5];
    
    [self.view addSubview:pageControl];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(4.5 * width - 40, 400, 80, 40)];
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:button];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)go {
    MainViewController *controller = [[MainViewController alloc]init];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger pageNumber = scrollview.contentOffset.x / scrollview.bounds.size.width;
    [pageControl setCurrentPage:pageNumber];
    NSLog(@"%ld", pageNumber);
}

@end
