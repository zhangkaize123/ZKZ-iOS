//
//  MainViewController.h
//  录音机
//
//  Created by 我赢职场 on 11/9/14.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface MainViewController : UIViewController
{
    AVAudioRecorder * recorder;//录音机
    UILabel * label;
    AVAudioPlayer * player;//播放器
}
@end
