//
//  funnyrdViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "funnyrdViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "WinViewController.h"
#import "FunList.h"
#import "FunStore.h"
#import "FunCell.h"

@interface funnyrdViewController ()

@end

@implementation funnyrdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"全“球”俱备,无趣味?不趣球!";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //注册cell 类
    [self.tableView registerClass:[FunCell class] forCellReuseIdentifier:@"cellId"];
    
    //注册观察者
    [[FunList shareInstance]addObserver:self forKeyPath:@"data" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld                                                                                                        context:nil];
    //刷新
    self.refreshControl=[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self.tableView reloadData];
}

- (void)onRefresh:(id)sender{
    FunStore *ds=[[FunStore alloc]init];
    [ds requestDataWithSuccess:^{
        [self.refreshControl endRefreshing];
    } Failure:^{
        [self.refreshControl endRefreshing];
    }];
}
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [FunList shareInstance].data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FunCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    [cell.observerItem removeObserver:cell forKeyPath:@"text"];
    
    [cell updateCellData:[FunList shareInstance].data[indexPath.row]];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WinViewController *dvc = [[WinViewController alloc] init];
    [FunList shareInstance].item = [FunList shareInstance].data[indexPath.row];
    
    [self.navigationController pushViewController:dvc animated:YES];
}
- (void)dealloc{
    [[FunList shareInstance]removeObserver:self forKeyPath:@"data"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
