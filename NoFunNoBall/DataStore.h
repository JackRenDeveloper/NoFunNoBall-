//
//  DataStore.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

//1.向服务器发送网络请求
//2.把得到的数据写入到Model
//3.告诉Viewcontroller请求完成

-(void)requestDataWithSuccess:(void(^)())success Failure:(void(^)())failure;
@end
