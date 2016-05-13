//
//  AppModel.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

//世预赛
////比赛ID
@property(nonatomic)NSString *match_id;
////比赛次序
//@property(nonatomic)NSString *BetOrder;
//time
@property(nonatomic)NSString *time;
//leagueName
@property(nonatomic)NSString *league;
//主队图片
@property(nonatomic)NSString *team1_logo;
//客队图片
@property(nonatomic)NSString *team2_logo;
//比赛双方
@property(nonatomic)NSString *match_name;
//右下角图片
@property(nonatomic)NSString *league_logo;

@end
