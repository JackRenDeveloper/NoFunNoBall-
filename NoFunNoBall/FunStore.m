//
//  FunStore.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "FunStore.h"
#import "DataItem.h"
#import "FunList.h"
#import <AFNetworking/AFNetworking.h>

@implementation FunStore

-(void)requestDataWithSuccess:(void(^)())success Failure:(void(^)())failure
{
    //刷新的时候去请求数据
    NSString *path = @"http://www.qiuwin.com/I/v1.php/SuperLive3/BlogList/1/0/0/.json?version=9";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //服务器返回数据的类型text/html
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([FunList shareInstance].data.count != 0) {
            [[FunList shareInstance].data removeAllObjects];
        }
        
        //        NSLog(@"responseObject = %@",responseObject);
        
        for (NSDictionary *item in responseObject[@"list"]) {
            
            DataItem *dataItem = [[DataItem alloc] init];
            
            
            dataItem.identity = item[@"time"];
            
            dataItem.title = item[@"name"];
            
            dataItem.text = item[@"content"];
            
            dataItem.pubtime = item[@"time"];
            
            dataItem.imageUrl = item[@"image"];
            
            [[FunList shareInstance].data addObject:dataItem];
            
        }
        
        NSLog(@"%ld",[FunList shareInstance].data.count);
        //排序
        [[[FunList shareInstance] mutableArrayValueForKeyPath:@"data"] sortUsingComparator:^NSComparisonResult(DataItem * obj1, DataItem * obj2) {
            return [obj1.created_at compare: obj2.created_at];
        }];
        
        success();
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure();
        NSLog(@"error = %@",error.localizedDescription);
    }];
}

@end

