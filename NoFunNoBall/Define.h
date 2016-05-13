//
//  Define.h
//  LimitFreeProject
//
//  Created by qianfeng on 14-12-29.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#ifndef LimitFreeProject_Define_h
#define LimitFreeProject_Define_h

#define kScreenSize [UIScreen mainScreen].bounds.size


/*
 界面类型
 */

#define kSuperType   @"superlm"
#define kLimitType    @"limited"
#define kGoalType    @"Goallm"
#define kAsiaType  @"Asialm"
#define kFunType      @"funlm"

#define kReduceType   @"sales"
#define kFreeType     @"free"
#define kDetailOfFirstType   @"detail"


//详情页面
#define kDetailType  @"detail"

//趣球详情页面
#define kDetaiType @"detaillm"
//中超页面接口
#define kSuperlmUrl  @"http://platform.sina.com.cn/footv1/schedule?app_key=3897943680&l_type=208&top_teams=136%2C172%2C51975%2C5065%2C146%2C170%2C264%2C179%2C139%2C143%2C153%2C266%2C144%2C148%2C41300%2C47193%2C&format=json"

//世预赛页面接口
#define kLimitUrl @"http://www.qiuwin.com/I/v1.php/SuperLive3/MatchList/1/1/1/.json?version=9"

//射手页面接口
#define kGoallmUrl @"http://platform.sina.com.cn/footv1/opta_rank?app_key=3897943680&lid=8&year=2012&format=json&item=goal&type=1&standard=1"

//趣球页面接口
#define kfunlmUrl @"http://www.qiuwin.com/I/v1.php/SuperLive3/BlogList/1/0/0/.json?version=9"



//杂志页面接口
#define kReduceUrl @"http://ktx.cms.palmtrends.com/api_v2.php?action=get_mags_list&uid=10067567&offset=%ld&count=15"

//酷图页面接口
#define kFreeUrl @"http://ktx.cms.palmtrends.com/api_v2.php?action=piclist&sa=&uid=10067567&offset=%ld&count=12"

//资讯详情接口
#define kDetailOfInfoUrl @"http://ktx.cms.palmtrends.com/api_v2.php?action=article&uid=10067567&id=%@"
//杂志详情接口
#define kDetailOfManaUrl @"http://ktx.cms.palmtrends.com/api_v2.php?action=get_mags_detail&uid=10067567&magid=%@"

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif
