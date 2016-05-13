//
//  DataList.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "DataList.h"

@implementation DataList

+(instancetype)shareInstance{
    static DataList *dataList = nil;
    //多线程安全的单例
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataList = [[DataList alloc]init];
    });
    return dataList;
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        _data = [NSMutableArray array];
    }
    return self;
}

@end

