//
//  NetWorkManager.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "NetWorkManager.h"
#import "AppModel.h"
#import "AppModelStore.h"
#import <AFNetworking/AFNetworking.h>
@implementation NetWorkManager

+(void)requestDataWithUrl:(NSString *)url Type:(NSString *)type Success:(void (^)())success Failure:(void (^)())failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //get
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject){
        if (responseObject) {
            
            if ([[AppModelStore shareInstance] getDataSourceWithType:type].count != 0) {
                [[[AppModelStore shareInstance] getDataSourceWithType:type]removeAllObjects];
            }
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            for (NSDictionary *dictData in dict[@"list"]) {
                
                AppModel *model = [[AppModel alloc]init];
                
                //kvc
                [model setValuesForKeysWithDictionary:dictData];
                //根据类型添加相应数据
                [[[AppModelStore shareInstance] getDataSourceWithType:type] addObject:model];
                
                //                NSLog(@"count=%ld",[[AppModelStore shareInstance]getDataSourceWithType:type].count);
                
            }
            
            
        }
        success();
    }
         failure:^(AFHTTPRequestOperation *operation,NSError *error){
             failure();
         }];
    
}

@end

