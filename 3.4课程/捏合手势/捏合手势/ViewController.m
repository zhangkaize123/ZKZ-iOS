//
//  ViewController.m
//  捏合手势
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *image=[UIImage imageNamed:@"nc"];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:image];
    imageView.frame=self.view.frame;
    [self.view addSubview:imageView];
    
    //捏合
    UIPinchGestureRecognizer *pgr=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [imageView addGestureRecognizer:pgr];
    
}

-(void)pinch:(UIPinchGestureRecognizer *)recognizer
{
    NSLog(@"this is pinch%g",recognizer.scale);
    
    
    
}

@end
