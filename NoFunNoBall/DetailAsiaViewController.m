//
//  DetailAsiaViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "DetailAsiaViewController.h"
#import "AsiaList.h"

@interface DetailAsiaViewController ()
{
    UIScrollView *_scrollView;
    UILabel *_scrollLabel;
    NSTimer *_timer;
    BOOL _isFlying;
}
@end

@implementation DetailAsiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建定时器
    [self createTimer];
    //创建滚动视图
    [self createScrollView];
    //创建label
    [self createScrollLabel];
    //调用自动滚动方法
    [self performSelector:@selector(autoScroll) withObject:nil afterDelay:0.1];
    
}

#pragma mark - createTimer
-(void)createTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(ballFly) userInfo:nil repeats:YES];
}

#pragma mark - ballFly
-(void)ballFly{
    static int x = 1;
    static int y = 1;
    
    UIButton *btn = (UIButton *)[self.view viewWithTag:333];
    CGRect frame = btn.frame;
    frame.origin.x += x;
    frame.origin.y += y;
    //重新设置label的frame
    btn.frame = frame;
    
    //触碰边界判断
    if (frame.origin.x<=0
        || CGRectGetMaxX(frame)>=CGRectGetMaxX(self.view.frame)) {
        //水平方向改变（一段时间内x一直为-1）
        x *= -1;
    }
    if (frame.origin.y<=0
        || CGRectGetMaxY(frame)>=CGRectGetMaxY(self.view.frame)) {
        //垂直方向改变（一段时间内y一直为-1）
        y *= -1;
    }
}

#pragma mark - btnClick
-(void)btnClick:(UIButton *)btn{
    //模态跳转返回
    //前面出现了模态跳转到第二张返回必须要用下面的函数
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)createScrollView{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    button.tag = 333;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //创建与屏幕等大的imageView
    UIImage *image = [UIImage imageNamed:@"13y58PICPf2.jpg!qt226.jpeg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = image;
    
    [self.view addSubview:imageView];
    [self.view addSubview:button];
    
    _scrollView = [[UIScrollView alloc]init];
    CGSize size = self.view.frame.size;
    _scrollView.frame = CGRectMake(0, 0, size.width, 50);
    _scrollView.center = CGPointMake(size.width/2, size.height/3-30);
    _scrollView.backgroundColor = [UIColor redColor];
    
    [imageView addSubview:_scrollView];
    
}
-(void)createScrollLabel{
    
    
    _scrollLabel = [[UILabel alloc]init];
    NSString *timeStr = [AsiaList shareInstance].item.time;
    NSString *digestStr = [AsiaList shareInstance].item.digest;
    NSString *strAll = [NSString stringWithFormat:@"☀️%@|🐦内容:%@",timeStr,digestStr];
    
    _scrollLabel.text = strAll;
    
    _scrollLabel.font = [UIFont systemFontOfSize:40];
    _scrollLabel.textColor = [UIColor whiteColor];
    //尺寸适应字体
    [_scrollLabel sizeToFit];
    CGRect frame = _scrollLabel.frame;
    frame.origin.x = _scrollView.frame.size.width;
    _scrollLabel.frame = frame;
    [_scrollView addSubview:_scrollLabel];
    _scrollView.contentSize = CGSizeMake(_scrollLabel.frame.size.width+_scrollView.frame.size.width, 50);
    
}

-(void)autoScroll{
    CGPoint offset = _scrollView.contentOffset;
    offset.x += 50;
    if (offset.x >= _scrollView.contentSize.width) {
        offset.x = 0;
        _scrollView.contentOffset = offset;
    }else{
        [_scrollView setContentOffset:offset animated:YES];
    }
    [self performSelector:@selector(autoScroll) withObject:nil afterDelay:0.1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
