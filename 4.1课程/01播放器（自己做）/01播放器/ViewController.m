//
//  ViewController.m
//  01播放器
//
//  Created by 张凯泽 on 15-4-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ZKZInfo.h"
@interface ViewController ()<AVAudioPlayerDelegate>
{
    AVAudioPlayer *player;//声音播放器
    int count;
}
@property(nonatomic,strong)NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)startTap;
- (IBAction)preTap;
- (IBAction)nextTap;
- (IBAction)soundChange;
- (IBAction)progressChange;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
@property (weak, nonatomic) IBOutlet UIButton *preBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    player.delegate=self;
    count=0;
    self.array=[[NSMutableArray alloc]init];
    for (int i=0; i<3; i++) {
        ZKZInfo *infoStr=[[ZKZInfo alloc]init];
        NSString *str=@"a";
        ;
        infoStr.imageName=[NSString stringWithFormat:@"%c%@",[str UTF8String][0]+i,@".png"];
        infoStr.playerName=[NSString stringWithFormat:@"%c%@",[str UTF8String][0]+i,@".mp3"];
        //NSLog(@"imageName=%@,playerName=%@",infoStr.imageName,infoStr.playerName);
        [self.array addObject:infoStr];
    }
    //设置前一首歌不能点击
    self.preBtn.enabled=NO;
    [self loadValueWithCount:count];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
}
-(void)onTimer
{
    self.progressSlider.value=player.currentTime;
}
#pragma mark-----播放器的代理方法
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.startBtn setTitle:@"开始" forState:UIControlStateNormal];
}
-(void)loadValueWithCount:(int)number
{
    ZKZInfo *Info=[self.array objectAtIndex:number];
    self.imageView.image=[UIImage imageNamed:Info.imageName];
    NSString *path=[[NSBundle mainBundle]pathForResource:Info.playerName ofType:nil];
    NSURL *url=[NSURL fileURLWithPath:path];
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    player.delegate=self;
    if (player) {
        [player prepareToPlay];
    }else{
        NSLog(@"对不起，创建播放器失败");
    }
    //设置歌曲最大最小值
    self.progressSlider.minimumValue=0;
    self.progressSlider.maximumValue=player.duration;
    //设置歌曲声音最大最小值
    self.soundSlider.minimumValue=0;
    self.soundSlider.maximumValue=player.volume;
    [self.soundSlider setValue:player.volume*0.5];

}
//开始播放
- (IBAction)startTap {
    NSString *str=self.startBtn.titleLabel.text;
    if ([str isEqualToString:@"开始"]) {
        [self.startBtn setTitle:@"暂停" forState:UIControlStateNormal];
        [player play];
    }else{
        [self.startBtn setTitle:@"开始" forState:UIControlStateNormal];
        [player stop];
    }
    
    
}
//前一首歌
- (IBAction)preTap {
    self.nextBtn.enabled=YES;
    count--;
    if (count==0) {
        self.preBtn.enabled=NO;
    }
    player=nil;
    [self loadValueWithCount:count];
}
//下一首歌
- (IBAction)nextTap {
    self.preBtn.enabled=YES;
    count++;
    if (count==2) {
        self.nextBtn.enabled=NO;
    }
     player=nil;
    [self loadValueWithCount:count];
    NSLog(@"%@",player);
}
//调节音量
- (IBAction)soundChange {
    player.volume=self.soundSlider.value;
}
//调节进度
- (IBAction)progressChange {
       player.currentTime=self.progressSlider.value;
}
@end
