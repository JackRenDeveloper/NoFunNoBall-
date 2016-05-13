//
//  DataItem.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataItem : NSObject

//中超1
//标题
@property(strong,nonatomic)NSString *title;
//时间
@property(strong,nonatomic)NSString *created_at;
//地点
@property(strong,nonatomic)NSString *identity;
//左图
@property(strong,nonatomic)NSString *imageleftUrl;
//右图
@property(strong,nonatomic)NSString *imagerightUrl;

//图集2
//id
@property(strong,nonatomic)NSString *Id;
//name(标题)
@property(strong,nonatomic)NSString *name;
//大图
@property(strong,nonatomic)NSString *thumbSrc;
//小图
@property(strong,nonatomic)NSString *firstImag;
//小图描述
@property(strong,nonatomic)NSString *firstImagDescription;

//热榜3
//时间
@property(strong,nonatomic)NSString *time;
//内容
@property(strong,nonatomic)NSString *digest;

//趣球4
//Model 数据
////内容
@property(strong,nonatomic)NSString *text;

@property(strong,nonatomic) NSString *imageUrl;

@property(strong,nonatomic)NSString *pubtime;

//视频
//@property(strong,nonatomic)NSString *Vtime;
//@property(strong,nonatomic)NSString *Vtitle;
@property(strong,nonatomic)NSString *short_title;
@property(strong,nonatomic)NSString *url;
@property(strong,nonatomic)NSString *intro;
@property(strong,nonatomic)NSString *imagelink;

@end
