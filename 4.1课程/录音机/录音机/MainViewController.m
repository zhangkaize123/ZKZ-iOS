//
//  MainViewController.m
//  录音机
//
//  Created by 我赢职场 on 11/9/14.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    UIButton * recButton=[[UIButton alloc]initWithFrame:CGRectMake(20, 50, 280, 40)];
    recButton.backgroundColor=[UIColor redColor];
    [recButton setTitle:@"开始录音" forState:UIControlStateNormal];
    [recButton addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:recButton];
    
    UIButton * stopButton=[[UIButton alloc]initWithFrame:CGRectMake(20, 110, 280, 40)];
    stopButton.backgroundColor=[UIColor redColor];
    [stopButton setTitle:@"停止录音" forState:UIControlStateNormal];
    [stopButton addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
    UIButton * playButton=[[UIButton alloc]initWithFrame:CGRectMake(20, 170, 280, 40)];
    playButton.backgroundColor=[UIColor redColor];
    [playButton setTitle:@"播放录音" forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(20, 230, 280, 40)];
    label.backgroundColor=[UIColor redColor];
    [self.view addSubview:label];
    //录音文件的url
    NSString * path=NSTemporaryDirectory();
    NSString * filePath=[path stringByAppendingPathComponent:@"rec.caf"];
    NSLog(@"%@",filePath);
    //对录音机进行配置
    NSMutableDictionary * settings=[[NSMutableDictionary alloc]initWithCapacity:4];
    //采样的频率
    [settings setObject:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    //声道数
    [settings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    //采样位数
    [settings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //录音质量
    [settings setObject:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
    //真机调试应该添加的代码
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryRecord  error:nil];
    [audioSession setActive:YES error:nil];
    
    //构建录音机对象
    NSError * error;
    recorder=[[AVAudioRecorder alloc]initWithURL:[NSURL URLWithString:filePath] settings:settings error:&error];
    if(error)
    {
        NSLog(@"%@",error);
    }
}
-(void)play:(UIButton *)sender
{
    //真机调试应该添加的代码
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    if(![player play])
    {
        NSLog(@"play error!");
    }
    label.text=@"正在播放录音!";
}
-(void)start:(UIButton *)sender
{
    NSLog(@"this is start!");
    //开始录音
    if(![recorder record])
    {
        NSLog(@"error！");
    }
    label.text=@"正在录音，请肃静。。。";
}
-(void)stop:(UIButton *)sender
{
    NSLog(@"this is stop!");
    //停止录音
    [recorder stop];
    label.text=@"录音结束，你可以去播放了！";
    //录音文件的url
    NSString * path=NSTemporaryDirectory();
    NSString * filePath=[path stringByAppendingPathComponent:@"rec.caf"];
    NSURL *url=[NSURL fileURLWithPath:filePath];
    NSLog(@"url=%@",url);
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
