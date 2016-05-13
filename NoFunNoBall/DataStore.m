//
//  DataStore.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "DataStore.h"
#import "DataItem.h"
#import "DataList.h"
#import <AFNetworking/AFNetworking.h>

@implementation DataStore

-(void)requestDataWithSuccess:(void (^)())success Failure:(void (^)())failure{
    //刷新的时候去请求数据
    //中超视频点播
    NSString *path = @"http://platform.sina.com.cn/premierleague/list?app_key=3897943680&team=0&page=1&len=20&type=2";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    //服务器返回数据的类型text/html
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject){
        
        if ([DataList shareInstance].data.count != 0) {
            [[DataList shareInstance].data removeAllObjects];
        }
        
                NSLog(@"%@",responseObject);
        
        for (NSDictionary *item in responseObject[@"result"][@"data"]) {
           
            DataItem *dataItem = [[DataItem alloc]init];
            
            dataItem.time = item[@"time"];
            dataItem.title = item[@"title"];
            dataItem.short_title = item[@"short_title"];
            dataItem.url = item[@"url"];
            dataItem.intro = item[@"intro"];
            dataItem.imagelink = item[@"imagelink"];
            
            [[DataList shareInstance].data addObject:dataItem];
            NSLog(@"%ld",[DataList shareInstance].data.count);
        }
        //排序
        [[[DataList shareInstance] mutableArrayValueForKeyPath:@"data"]
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

