//
//  DetailSuperViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "DetailSuperViewController.h"
#import "AppCell.h"
#import "AppModel.h"
#import "AppModelStore.h"
#import <AFNetworking/AFNetworking.h>

@interface DetailSuperViewController ()
{
    //定时器
    NSTimer *_timer;
    BOOL _onTheWay;
}
@property(nonatomic)UIWebView *webView;

@end

@implementation DetailSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图
    [self createView];
    
    self.navigationItem.title = @"绿茵‘⚽️’场之分析";
    
}

-(void)createView{
    //创建与屏幕等大的imageView
    UIImage *image = [UIImage imageNamed:@"picture.jpeg"];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    
    imageView.image = image;
    
    [self.view addSubview:imageView];
    
    //取消导航控制器对布局的影响
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 130, 120)];
    btn.center = CGPointMake(self.view.frame.size.width/2,66);
    
    [btn setBackgroundImage:[UIImage imageNamed:@"qfx"] forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 60;
    
    [btn setTitle:@"⚽️分析" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:40];
    
    btn.showsTouchWhenHighlighted = YES;
    
    btn.tag = 333;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeFrame) userInfo:nil repeats:YES];
    
    _onTheWay = YES;
    
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
}

#pragma mark - changeFrame
-(void)changeFrame{
    UIButton *btn = (UIButton *)[self.view viewWithTag:333];
    CGRect frame = btn.frame;
    static int y = 10;
    if (frame.origin.y >= self.view.frame.size.height/2+15) {
        _onTheWay = NO;
        
    }
    if (_onTheWay == YES) {
        frame.origin.y += y;
        btn.frame = frame;
    }
}

-(void)onClick{
    [self.view addSubview:_webView];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"http://www.qiuwin.com/SuperLive/wap/MatchLiveState.php?MatchID=%@&showdata=1&showft=1",self.match_id]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    [_webView resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
