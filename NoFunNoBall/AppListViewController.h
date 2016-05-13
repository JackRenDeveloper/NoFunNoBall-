//
//  AppListViewController.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppListViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
//定义tableView
@property(nonatomic)UITableView *tableView;

//请求地址
@property (nonatomic)NSString *requestUrl;

//当前页数
@property (nonatomic)NSInteger currentPage;



//分类id
@property(nonatomic)NSString *catagoryId;

//是否正在刷新
@property (nonatomic) BOOL isRefreshing;
//是否正在加载
@property (nonatomic)BOOL isLoading;

//页面类型
@property (nonatomic)NSString *type;

-(void)firstDownload;
-(void)createRefreshView;

@end

