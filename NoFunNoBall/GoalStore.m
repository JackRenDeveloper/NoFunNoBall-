//
//  GoalStore.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "GoalStore.h"
#import "DataItem.h"
#import "GoalList.h"
#import <AFNetworking/AFNetworking.h>

@implementation GoalStore

-(void)requestDataWithSuccess:(void(^)())success Failure:(void (^)())failure{
    
    //刷新的时候去请求数据
    NSString *path = @"http://zhiboba.3b2o.com/photoIndex/listJson/category/soccer?1447038718";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //服务器返回数据的类型text/html
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject){
        
        //避免重复
        if ([GoalList shareInstance].data.count != 0) {
            [[GoalList shareInstance].data removeAllObjects];                  }
        
        //        NSLog(@"responseObject = %@",responseObject);
        for (NSDictionary *item in responseObject[@"album"]) {
            
            DataItem *dataItem = [[DataItem alloc]init];
            
            dataItem.Id = item[@"id"];
            dataItem.name = item[@"name"];
            dataItem.thumbSrc = item[@"thumbSrc"];
            dataItem.firstImag = item[@"firstImg"];
            dataItem.firstImagDescription = item[@"firstImgDescription"];
            
            [[GoalList shareInstance].data addObject:dataItem];
        }
        
        NSLog(@"%ld",[GoalList shareInstance].data.count);
        
        //排序
        [[[GoalList shareInstance] mutableArrayValueForKeyPath:@"data"]
         sortUsingComparator:^NSComparisonResult(DataItem *obj1,DataItem *obj2){
             return [obj1.Id compare:obj2.Id];
         }];
        success();
        
    }failure:^(AFHTTPRequestOperation *operation,NSError *error){
        failure();
        NSLog(@"error = %@",error.localizedDescription);
    }];
    
}


@end

