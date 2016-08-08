//
//  MainViewController.m
//  节后复习题（nib版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segView;
- (IBAction)okTap;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)okTap {
    if ([self.segView selectedSegmentIndex]==0) {
        FirstViewController *first=[[FirstViewController alloc]initWithNibName:@"firstview" bundle:nil];
        first.otherstr=[self.segView titleForSegmentAtIndex:[self.segView selectedSegmentIndex]];
        [self presentViewController:first animated:YES completion:nil];

    }
//    if (self.segView selectedSegmentIndex==1) {
//        FirstViewController *first=[[FirstViewController alloc]initWithNibName:@"firstview" bundle:nil];
//        first.otherstr=self.segView titleForSegmentAtIndex:[self.segView selectedSegmentIndex]
//        [self presentViewController:first animated:YES completion:nil];
//        
//    }

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
