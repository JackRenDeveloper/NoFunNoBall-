//
//  FunViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "FunViewController.h"
#import "DetailFunViewController.h"

#define VIEW_WIDTH self.view.frame.size.width
#define VIEW_HEIGHT self.view.frame.size.height
@interface FunViewController ()
{
    //定时器
    NSTimer *_timer;
    BOOL _running;
    UIButton *_goButton;
    UIImage *_image;
    UIImageView *_imageView;
    UILabel *_label;
}
@end

@implementation FunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //BG
    _image = [UIImage imageNamed:@"big_bg.jpeg"];
    
    _imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    _imageView.image = _image;
    [self.view addSubview:_imageView];
    
    //一脚GO
    
    UIImage *image2 = [UIImage imageNamed:@"gogogo.jpg"];
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:image2];
    imageView2.frame = CGRectMake(0, 0, 200, 55);
    imageView2.center = CGPointMake(200, VIEW_HEIGHT/3);
    imageView2.tag = 520;
    //定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(goGOGO) userInfo:nil repeats:YES];
    _running = YES;
    
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(0, 0, VIEW_WIDTH/2,55);
    _label.center = CGPointMake(VIEW_WIDTH/4, VIEW_HEIGHT/3);
    _label.text = @"点击小球定乾坤👉";
    _label.font = [UIFont systemFontOfSize:20];
    _label.textColor = [UIColor redColor];
    _label.adjustsFontSizeToFitWidth = YES;
    
    _label.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_label];
    [self.view addSubview:imageView2];
    
    //添加button
    [self createButton];
    
}

-(void)createButton{
    _goButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _goButton.backgroundColor = [UIColor blueColor];
    _goButton.frame = CGRectMake(0, 0, 100, 100);
    _goButton.center = CGPointMake(VIEW_WIDTH/2+10, VIEW_HEIGHT/3);
    _image = [UIImage imageNamed:@"go_btn.jpeg"];    [_goButton setBackgroundImage:_image forState:UIControlStateNormal];
    //允许切割边界
    _goButton.clipsToBounds = YES;
    //设置圆角半径
    _goButton.layer.cornerRadius = 100;
    
    [_goButton addTarget:self action:@selector(goStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_goButton];
    
}

-(void)goGOGO{
    UIImageView *iv = (UIImageView *)[self.view viewWithTag:520];
    CGRect frameIV = iv.frame;
    static int x = 10;
    if (frameIV.origin.x >= VIEW_WIDTH||frameIV.origin.x <= -200) {
        x *= -1;
    }
    if (_running == YES) {
        frameIV.origin.x += x;
        iv.frame = frameIV;
    }
    
}


-(void)goStart{
    DetailFunViewController *fun = [[DetailFunViewController alloc]init];
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:fun];
    [self presentViewController:nc animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
