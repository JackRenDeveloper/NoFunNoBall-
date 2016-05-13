//
//  AppListViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "AppListViewController.h"
#import "AppCell.h"
#import "DetailGoalViewController.h"
#import "AppModelStore.h"
#import "JHRefresh.h"
#import "NetWorkManager.h"
#import "Define.h"
#import "DetailSuperViewController.h"


@interface AppListViewController ()

@end

@implementation AppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建tableView
    [self customTableView];
    
    UIImage *image = [UIImage imageNamed:@"shz.jpeg"];
    
    UIImageView *navImageView = [[UIImageView alloc]init];
    navImageView.frame = CGRectMake(20, 0, self.view.frame.size.width, 44);
    navImageView.image = image;
    
    [self.navigationController.navigationBar addSubview:navImageView];
    
}


-(void)customTableView{
    
    if (!self.tableView) {
        //创建tableView
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-64)];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        //注册
        [self.tableView registerNib:[UINib nibWithNibName:@"AppCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
        
        [self.view addSubview:self.tableView];
        
    }
    
    
}

#pragma mark - 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //行数
    return [[AppModelStore shareInstance] getDataSourceWithType:self.type].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    AppModel *model = [[AppModelStore shareInstance] getDataSourceWithType:self.type][indexPath.row];
    
    cell.currentPage = self.type;
    
    //    对cell进行更新
    [cell updateData:model indexPath:indexPath type:self.type];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //进入下一页面
    AppModel *model = [[AppModelStore shareInstance]getDataSourceWithType:self.type][indexPath.row];
    
    DetailSuperViewController *dvc = [[DetailSuperViewController alloc]init];
    
    dvc.match_id = model.match_id;
    
    [self.navigationController pushViewController:dvc animated:YES];
    
    
}

#pragma mark - 创建刷新视图
-(void)createRefreshView{
    __weak typeof(self) weakself = self;
    //添加下拉刷新视图
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakself.isRefreshing) {
            return ;
        }
        weakself.isRefreshing = YES;
        weakself.currentPage = 1;
        [weakself request];
    }];
    
    //添加上拉下载刷新视图
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        
        if (weakself.isLoading) {
            return ;
        }
        
        weakself.isLoading = YES;
        
        //设置页数
        weakself.currentPage++;
        [weakself request];
        
    }];
    
}


#pragma mark - 网络请求
-(void)firstDownload{
    self.isRefreshing = NO;
    self.isLoading = NO;
    self.catagoryId = @"0";
    self.currentPage = 0;
    [self request];
}

-(void)request{
    NSString *url = nil;
    
    //    url = [NSString stringWithFormat:self.requestUrl,self.currentPage,self.catagoryId];
    if ([self.type isEqualToString:kLimitType]) {
        
        url = [NSString stringWithFormat:@"%@",self.requestUrl];
    }else if ([self.type isEqualToString:kReduceType]){
        url = [NSString stringWithFormat:self.requestUrl,self.currentPage*15];
    }else if ([self.type isEqualToString:kDetailOfFirstType]){
        url = [NSString stringWithFormat:self.requestUrl,self.catagoryId];
    }else{
        
        url = [NSString stringWithFormat:self.requestUrl,self.currentPage*12];
    }
    
    
    
    [NetWorkManager requestDataWithUrl:url Type:self.type Success:^{
        [self.tableView reloadData];
        [self endRefresh];
    }Failure:^{
        [self endRefresh];
    }];
}

-(void)endRefresh{
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultNone];
    }
    if (self.isLoading) {
        self.isLoading = NO;
        [self.tableView footerEndRefreshing];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
