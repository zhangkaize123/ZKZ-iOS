//
//  ViewController.h
//  音乐播放器
//
//  Created by wyzc on 15-4-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer * player;//播放器
    NSArray * songs;//歌曲url的数组
    NSArray * images;//图片image对象的数组
    int current;//正在播放的歌曲0-2
}
@property (weak, nonatomic) IBOutlet UIImageView *picture;
- (IBAction)beforeTap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)play:(id)sender;

- (IBAction)afterTap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISlider *progSlider;
- (IBAction)progChange:(id)sender;
- (IBAction)volumeChange:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@end

