//
//  NetWorkManager.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject

+(void)requestDataWithUrl:(NSString *)url Type:(NSString *)type Success:(void(^)())success Failure:(void(^)())failure;

@end
