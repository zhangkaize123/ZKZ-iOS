//
//  ViewController.m
//  音乐播放器
//
//  Created by wyzc on 15-4-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    current=0;//正在播放的是第一首歌
    //播放列表
    songs=[NSArray arrayWithObjects:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"a" ofType:@"mp3"] ],[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"b" ofType:@"mp3"] ],[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"c" ofType:@"mp3"] ], nil];
    //图片列表
    images=[NSArray arrayWithObjects:[UIImage imageNamed:@"a.png"],[UIImage imageNamed:@"b.png"],[UIImage imageNamed:@"c.png"], nil];
    //用当前歌创建播放器
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:songs[current] error:nil];
    if(player==nil)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"创建播放器失败！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        //处理
    }
    player.delegate=self;
    //播放进度
    self.progSlider.minimumValue=0;
    self.progSlider.maximumValue=player.duration;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    //音量
    self.volumeSlider.minimumValue=0;
    self.volumeSlider.maximumValue=1;
    self.volumeSlider.value=0.5;
    player.volume=self.volumeSlider.value;
}
-(void)onTimer:(id)sender
{
    self.progSlider.value=player.currentTime;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)beforeTap:(UIButton *)sender {
    if(current==0)
    {
        return;
    }
    else
    {
        current--;
        player=[[AVAudioPlayer alloc]initWithContentsOfURL:songs[current] error:nil];
        player.delegate=self;
        [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
        //self.progSlider.minimumValue=0;
        self.progSlider.maximumValue=player.duration;
        self.picture.image=images[current];
    }
}
- (IBAction)play:(id)sender {
    NSString * title=self.playButton.titleLabel.text;
    if([title isEqualToString:@"播放"])
    {
        [player play];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    }
    else
    {
        [player stop];
        [sender setTitle:@"播放" forState:UIControlStateNormal];
    }
}

- (IBAction)afterTap:(UIButton *)sender {
    if(current==2)
    {
        return;
    }
    else
    {
        current++;
        player=[[AVAudioPlayer alloc]initWithContentsOfURL:songs[current] error:nil];
        player.delegate=self;
        [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
        //self.progSlider.minimumValue=0;
        self.progSlider.maximumValue=player.duration;
        self.picture.image=images[current];
    }

}
- (IBAction)progChange:(id)sender {
    player.currentTime=self.progSlider.value;
}

- (IBAction)volumeChange:(UISlider *)sender {
    player.volume=sender.value;
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"this is finish!");
    [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
}
@end
