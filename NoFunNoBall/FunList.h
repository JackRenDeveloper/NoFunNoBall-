//
//  FunList.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataItem.h"

@interface FunList : NSObject

//数据源
@property (strong , nonatomic) NSMutableArray *data;
//当前行（cell）的数据
@property (strong, nonatomic) DataItem *item;

//通过单例
+ (instancetype)shareInstance;

@end

