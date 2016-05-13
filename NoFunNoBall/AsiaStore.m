//
//  AsiaStore.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "AsiaStore.h"
#import "DataItem.h"
#import "AsiaList.h"
#import <AFNetworking/AFNetworking.h>

@implementation AsiaStore

-(void)requestDataWithSuccess:(void (^)())success Failure:(void (^)())failure{
    //刷新的时候去请求数据
    NSString *path = @"http://zhiboba.3b2o.com/recommend/dailyRankListJson/category/soccer?1447038509";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //服务器返回数据的类型text/html
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject){
        
        //避免重复
        if ([AsiaList shareInstance].data.count != 0) {
            [[AsiaList shareInstance].data removeAllObjects];                  }
        //        NSLog(@"responseObject = %@",responseObject);
        
        for (NSDictionary *item in responseObject) {
            
            DataItem *dataItem = [[DataItem alloc]init];
            
            dataItem.title = [NSString stringWithFormat:@"⚽️讯速:%@",item[@"title"]];
            dataItem.time = item[@"time"];
            dataItem.digest = item[@"digest"];
            
            [[AsiaList shareInstance].data addObject:dataItem];
        }
        //排序
        [[[AsiaList shareInstance] mutableArrayValueForKeyPath:@"data"]
         sortUsingComparator:^NSComparisonResult(DataItem *obj1,DataItem *obj2){
             return [obj1.time compare:obj2.time];
         }];
        success();
        
    }failure:^(AFHTTPRequestOperation *operation,NSError *error){
        failure();
        NSLog(@"error = %@",error.localizedDescription);
    }];
    
}


@end

