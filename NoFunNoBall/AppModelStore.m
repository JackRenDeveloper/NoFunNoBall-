//
//  AppModelStore.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "AppModelStore.h"
#import "Define.h"

@implementation AppModelStore

+(instancetype)shareInstance{
    static AppModelStore *store = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        store = [[AppModelStore alloc] init];
    });
    return store;
}
-(instancetype)init{
    if (self = [super init]) {
        _infoData = [NSMutableArray array];
        _manaData = [NSMutableArray array];
        _picData = [NSMutableArray array];
        _detailData = [NSMutableArray array];
    }
    return self;
}

-(NSMutableArray *)getDataSourceWithType:(NSString *)type{
    //资讯
    if ([type isEqualToString:kLimitType]) {
        return _infoData;
        //杂志
    }else if ([type isEqualToString:kReduceType]){
        return _manaData;
        //酷图
    }else if([type isEqualToString:kFreeType]){
        return _picData;
    }else{
        return _detailData;
    }
}

@end

