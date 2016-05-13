//
//  AsiaViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "AsiaViewController.h"
#import "DataItem.h"
#import "AsiaList.h"
#import "AsiaStore.h"
#import "AsiaCell.h"
#import <AFNetworking/AFNetworking.h>
#import "DetailAsiaViewController.h"
#import "DetailVideoViewController.h"


@interface AsiaViewController ()

@end

@implementation AsiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定制导航按钮
    [self customNaviItem];
    
    [[AsiaList shareInstance]addObserver:self forKeyPath:@"data" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    
}

#pragma mark - 自定义导航按钮（视频）
-(void)customNaviItem{
    //设置右侧的item
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    //设置title
    [rightBtn setTitle:@"中超" forState:UIControlStateNormal];
    //设置title颜色
    [rightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //设置button的背景图
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"right_btn"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(onTheWayToVideo) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}
-(void)onTheWayToVideo{
    
    DetailVideoViewController *dvivc = [[DetailVideoViewController alloc]init];
    
   [self.navigationController pushViewController:dvivc animated:YES];
}

#pragma mark - 下载数据
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self.tableView reloadData];
}

- (void)onRefresh:(id)sender{
    AsiaStore *ds=[[AsiaStore alloc]init];
    [ds requestDataWithSuccess:^{
        [self.refreshControl endRefreshing];
    } Failure:^{
        [self.refreshControl endRefreshing];
    }];
}
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [AsiaList shareInstance].data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AsiaCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell=[[AsiaCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
        [cell.observerItem removeObserver:cell forKeyPath:@"title"];
        [cell updateCellData:[AsiaList shareInstance].data[indexPath.row]];
        
        UIButton *goButton = [UIButton buttonWithType:UIButtonTypeSystem];
        goButton.backgroundColor = [UIColor redColor];
        goButton.frame = CGRectMake(300, 10, 70, 50);
        UIImage *image = [UIImage imageNamed:@"42.jpg"];
        [goButton setBackgroundImage:image forState:UIControlStateNormal];
        //允许切割边界
        goButton.clipsToBounds = YES;
        //设置圆角半径
        goButton.layer.cornerRadius = 30;
        
        [cell addSubview:goButton];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [AsiaList shareInstance].item=[AsiaList shareInstance].data[indexPath.row];
    
    DetailAsiaViewController *dvc = [[DetailAsiaViewController alloc] init];
    
    //    [self.navigationController pushViewController:dvc animated:YES];
    [self presentViewController:dvc animated:YES completion:nil];
    //    //16秒
    //    [self performSelector:@selector(dismissAfterSeconds) withObject:dvc afterDelay:16];
}
//-(void)dismissAfterSeconds{
//    DetailAsiaViewController *dvc = [[DetailAsiaViewController alloc]init];
//    [self dismissViewControllerAnimated:dvc completion:nil];
//}

- (void)dealloc{
    [[AsiaList shareInstance]removeObserver:self forKeyPath:@"data"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
