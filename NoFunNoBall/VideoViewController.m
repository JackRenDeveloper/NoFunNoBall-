//
//  VideoViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/19.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "VideoViewController.h"
#import "DataList.h"
#import "DataItem.h"
#import "DataStore.h"
#import <AFNetworking/AFNetworking.h>
//#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController ()

{
    //定时器
    NSTimer *_timer;
    BOOL _onTheWay;
}

//网络播放
//@property(nonatomic)MPMoviePlayerViewController *netWorkMP;
//网页播放
@property(nonatomic)UIWebView *webView;


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //创建button
    [self createButton];
    
    self.navigationItem.title = @"⚽️情";
    
    self.view.backgroundColor = [UIColor redColor];
    
}

-(void)createButton{
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    //创建与屏幕等大的imageView
    UIImage *image = [UIImage imageNamed:@"VideoBG.jpeg"];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    
    imageView.image = image;
    
    [self.view addSubview:imageView];
    
    //取消导航控制器对布局的影响
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    //求视频
//    UIButton *btnV = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
//    btnV.center = CGPointMake(self.view.frame.size.width/2+35,66);
//    
//    [btnV setBackgroundImage:[UIImage imageNamed:@"qfx"] forState:UIControlStateNormal];
//    btnV.clipsToBounds = YES;
//    btnV.layer.cornerRadius = 30;
//    
//    [btnV setTitle:@"⚽️视频" forState:UIControlStateNormal];
//    btnV.titleLabel.font = [UIFont systemFontOfSize:20];
//    
//    btnV.showsTouchWhenHighlighted = YES;
//    
//    btnV.tag = 332;
//    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeFrame) userInfo:nil repeats:YES];
//    
//    _onTheWay = YES;
//    
//    [btnV addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:btnV];
//    
    //求网页
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    btn.center = CGPointMake(self.view.frame.size.width/2-45,66);
    
    [btn setBackgroundImage:[UIImage imageNamed:@"qfx"] forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 30;
    
    [btn setTitle:@"⚽️网页" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    
    btn.showsTouchWhenHighlighted = YES;
    
    btn.tag = 333;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeFrame) userInfo:nil repeats:YES];
    
    _onTheWay = YES;
    
    [btn addTarget:self action:@selector(playToHTTP) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];

}

#pragma mark - changeFrame
-(void)changeFrame{
    UIButton *btn = (UIButton *)[self.view viewWithTag:333];
    CGRect frame = btn.frame;
    static int y = 10;
//    UIButton *btnV = (UIButton *)[self.view viewWithTag:332];
//    CGRect frameV = btnV.frame;

    if (frame.origin.y >= self.view.frame.size.height/2+128) {
        _onTheWay = NO;
        
    }
    if (_onTheWay == YES) {
        frame.origin.y += y;
        btn.frame = frame;
        
//        frameV.origin.y += y;
//        btnV.frame = frameV;
    }
}

//-(void)playVideo{
//        NSString *path = [DataList shareInstance].item.url;
//        NSURL *url = [NSURL URLWithString:path];
//        //是否创建本地播放器对象
//        if (!self.netWorkMP) {
//            self.netWorkMP = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
//        }
//        //播放
//        [self.netWorkMP.moviePlayer play];
//    
//        [self presentViewController:self.netWorkMP animated:YES completion:nil];
//
//}

-(void)playToHTTP{
    //网页
    [self.view addSubview:_webView];
    
    NSString *path = [DataList shareInstance].item.url;
    NSURL *url = [NSURL URLWithString:path];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    [_webView resignFirstResponder];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
