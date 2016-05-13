//
//  DetailVideoViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/18.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "DetailVideoViewController.h"
//#import <MediaPlayer/MediaPlayer.h>
#import "CustomCell.h"
#import "DataItem.h"
#import "DataList.h"
#import "DataStore.h"
#import <AFNetworking/AFNetworking.h>
#import "VideoViewController.h"


@interface DetailVideoViewController ()

//网络播放
//@property(nonatomic)MPMoviePlayerViewController *netWorkMP;
//网页播放
@property(nonatomic)UIWebView *webView;

@end

@implementation DetailVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"精彩⚽️视";
    
    
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    //注册观察者
    [[DataList shareInstance]addObserver:self forKeyPath:@"data" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //刷新
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(onRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self.tableView reloadData];
}

- (void)onRefresh:(id)sender{
    DataStore *ds=[[DataStore alloc]init];
    [ds requestDataWithSuccess:^{
        [self.refreshControl endRefreshing];
    } Failure:^{
        [self.refreshControl endRefreshing];
    }];
}
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [DataList shareInstance].data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell=[[CustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
        [cell.observerItem removeObserver:cell forKeyPath:@"title"];
        [cell updateCellData:[DataList shareInstance].data[indexPath.row]];
        
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}
#pragma mark - select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [self.view addSubview:_webView];
//    
//    NSString *path = [DataList shareInstance].item.url;
//    NSURL *url = [NSURL URLWithString:path];
//    
//    //网页
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [_webView loadRequest:request];
//    [_webView resignFirstResponder];
    
    [DataList shareInstance].item = [DataList shareInstance].data[indexPath.row];
    VideoViewController *vv = [[VideoViewController alloc]init];
    [self.navigationController pushViewController:vv animated:YES];
    
    
//    //是否创建本地播放器对象
//    if (!self.netWorkMP) {
//        self.netWorkMP = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
//    }
//    //播放
//    [self.netWorkMP.moviePlayer play];
    
//    [self presentViewController:self.netWorkMP animated:YES completion:nil];

}

- (void)dealloc{
    [[DataList shareInstance]removeObserver:self forKeyPath:@"data"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.height-44-69;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
