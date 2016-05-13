//
//  GoalViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "GoalViewController.h"
#import "DataItem.h"
#import "GoalCell.h"
#import "GoalList.h"
#import "GoalStore.h"
#import <AFNetworking/AFNetworking.h>
#import "DetailGoalViewController.h"
@interface GoalViewController ()

@end

@implementation GoalViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //    [self firstDownload];
    //
    //    [self createRefreshView];
    
    //注册观察者
    [[GoalList shareInstance]addObserver:self forKeyPath:@"data" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self.tableView reloadData];
}

- (void)onRefresh:(id)sender{
    GoalStore *ds=[[GoalStore alloc]init];
    [ds requestDataWithSuccess:^{
        [self.refreshControl endRefreshing];
    } Failure:^{
        [self.refreshControl endRefreshing];
    }];
}
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [GoalList shareInstance].data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //    GoalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //
    //    [cell.observerItem removeObserver:cell forKeyPath:@"title"];
    //
    //    [cell updateCellData:[GoalList shareInstance].data[indexPath.row]];
    
    
    GoalCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell=[[GoalCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
        [cell.observerItem removeObserver:cell forKeyPath:@"title"];
        [cell updateCellData:[GoalList shareInstance].data[indexPath.row]];
        
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [GoalList shareInstance].item=[GoalList shareInstance].data[indexPath.row];
    
    DetailGoalViewController *dvc = [[DetailGoalViewController alloc]init];
    [self.navigationController pushViewController:dvc animated:YES];
}
- (void)dealloc{
    [[GoalList shareInstance]removeObserver:self forKeyPath:@"data"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
