//
//  ViewController.m
//  使用NIB的表示图
//
//  Created by 张凯泽 on 15-2-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UINib *nib=[UINib nibWithNibName:@"MainCell" bundle:nil];
    
    [self.tableview registerNib:nib forCellReuseIdentifier:@"mycell"];
    //另一个单元格
    UINib *nib2=[UINib nibWithNibName:@"OtherCell" bundle:nil];
    [self.tableview registerNib:nib2 forCellReuseIdentifier:@"mycell2"];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //在表示图中显示不同的单元格。
         MainTableViewCell*cell;
    if (indexPath.row%2==0)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
        cell.iiiiiiii.text=@"ttttt";
    }
   else
   {
       cell=[tableView dequeueReusableCellWithIdentifier:@"mycell2"];
   }
//    if (cell==nil)
//    {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
//    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
