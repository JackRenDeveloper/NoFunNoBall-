//
//  DetailGoalViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "DetailGoalViewController.h"
#import "GoalList.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@interface DetailGoalViewController ()

@end

@implementation DetailGoalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图
    [self createView];
    
    self.navigationItem.title = @"绿茵‘⚽️’场";
}

-(void)createView{
    //创建与屏幕等大的imageView
    UIImage *image = [UIImage imageNamed:@"qfx.jpeg"];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    
    imageView.image = image;
    
    [self.view addSubview:imageView];
    //图片
    
    UIImageView *descImageView = [[UIImageView alloc]init];
    
    [descImageView setImageWithURL:[NSURL URLWithString:[GoalList shareInstance].item.firstImag] placeholderImage:[UIImage imageNamed:@"24E58PICGrd.jpg!qt226.jpeg"]];
    descImageView.frame = CGRectMake(0, 0, 300, 200);
    descImageView.center = CGPointMake(self.view.frame.size.width/2, 170);
    
    [imageView addSubview:descImageView];
    //文本
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0,300, 150);
    label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+60);
    label.backgroundColor = [UIColor greenColor];
    label.text = [GoalList shareInstance].item.firstImagDescription;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:50];
    //阴影
    label.shadowColor = [UIColor yellowColor];
    label.clipsToBounds = YES;
    label.layer.borderColor = [[UIColor redColor]CGColor];
    label.layer.borderWidth = 2;
    label.layer.cornerRadius = 25;
    label.numberOfLines = 16;
    
    label.adjustsFontSizeToFitWidth = YES;
    
    [imageView addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
