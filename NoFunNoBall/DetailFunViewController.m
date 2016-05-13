//
//  DetailFunViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "DetailFunViewController.h"
#import "FunViewController.h"
#import "funnyrdViewController.h"

#define VIEW_WIDTH self.view.frame.size.width
#define VIEW_HEIGHT self.view.frame.size.height


@interface DetailFunViewController ()
{
    //定时器
    NSTimer *_timer;
    BOOL _running;
}
@end

@implementation DetailFunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"欢迎进入“趣球一族”";
    
    self.view.backgroundColor = [UIColor redColor];
    //返回
    [self createButtonReturn];
    //进入
    [self createButtonGoing];
    [self createView];
    //进入
    [self createLabel1];
    //返回
    [self createLabel2];
}

-(void)createLabel1{
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 100, 50);
    label.center = CGPointMake(VIEW_WIDTH/3+20, VIEW_HEIGHT/2);
    label.text = @"点击进入→_→";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    label.clipsToBounds = YES;
    label.layer.borderColor = [[UIColor greenColor]CGColor];
    label.layer.borderWidth = 5;
    label.layer.cornerRadius = 25;
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 3;
    label.tag = 331;
    [self.view addSubview:label];
}
-(void)createLabel2{
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 50, 100);
    label.center = CGPointMake(VIEW_WIDTH/2+77, VIEW_HEIGHT/2);
    label.text = @"拒绝来访⬆️";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    label.clipsToBounds = YES;
    label.layer.borderColor = [[UIColor greenColor]CGColor];
    label.layer.borderWidth = 5;
    label.layer.cornerRadius = 25;
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 3;
    
    [self.view addSubview:label];
}


-(void)createView{
    
    UIImage *bigimage = [UIImage imageNamed:@"00B58PICPcQ.jpg!qt226.jpeg"];
    UIImageView *bigimageView = [[UIImageView alloc]initWithImage:bigimage];
    bigimageView.frame = CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64);
    
    UIImage *image = [UIImage imageNamed:@"41.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.center = CGPointMake(VIEW_WIDTH/2-150, VIEW_HEIGHT/2);
    imageView.tag = 332;
    
    [bigimageView addSubview:imageView];
    [self.view addSubview:bigimageView];
    
}
//拒绝来访
-(void)createButtonReturn{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0,50, 100);
    button.center = CGPointMake(VIEW_WIDTH/2+77, VIEW_HEIGHT/2);
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:@"拒绝" forState:UIControlStateNormal];
    button.layer.cornerRadius = 25;
    [button addTarget:self action:@selector(onTheWay) forControlEvents:UIControlEventTouchUpInside];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(change) userInfo:nil repeats:YES];
    _running = YES;
    
    [self.view addSubview:button];
}

-(void)createButtonGoing{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(0, 0,100, 50);
    button.center = CGPointMake(VIEW_WIDTH/3+20, VIEW_HEIGHT/2);
    button.backgroundColor = [UIColor yellowColor];
    button.layer.cornerRadius = 25;
    [button addTarget:self action:@selector(centerGoing) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 333;
    [self.view addSubview:button];
}
-(void)centerGoing{
    funnyrdViewController *haha = [[funnyrdViewController alloc]init];
    [self.navigationController pushViewController:haha animated:YES];
}


-(void)change{
    UIButton *button = (UIButton *)[self.view viewWithTag:333];
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:332];
    UILabel *label = (UILabel *)[self.view viewWithTag:331];
    CGRect frameLabel = label.frame;
    CGRect frameView = imageView.frame;
    CGRect frame = button.frame;
    static int y = 20;
    static int x = 20;
    if (frame.origin.y <= 150) {
        _running = NO;
    }
    if (_running == YES) {
        frame.origin.y -= y;
        frame.origin.x += x;
        button.frame = frame;
        
        frameView.origin.x += x;
        frameView.origin.y -= y;
        imageView.frame = frameView;
        
        frameLabel.origin.x += x;
        frameLabel.origin.y -= y;
        label.frame = frameLabel;
    }
}

-(void)onTheWay{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
