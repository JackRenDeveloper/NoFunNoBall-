//
//  AppModelStore.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModelStore : NSObject
//单例
+(instancetype)shareInstance;

//资讯页面的数据源
@property (nonatomic) NSMutableArray *infoData;

//杂志页面的数据源
@property (nonatomic) NSMutableArray *manaData;

//酷图页面的数据源
@property (nonatomic) NSMutableArray *picData;

//根据页面的类型返回相应的数据源
-(NSMutableArray *)getDataSourceWithType:(NSString *)type;

//详情界面数据源
@property(nonatomic)NSMutableArray *detailData;


@end
