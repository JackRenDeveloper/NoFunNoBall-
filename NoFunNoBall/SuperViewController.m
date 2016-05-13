//
//  SuperViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "SuperViewController.h"
#import "CustomCell.h"
#import "DataItem.h"
#import "DataList.h"
#import "DataStore.h"
#import <AFNetworking/AFNetworking.h>
#import "DetailSuperViewController.h"


@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self firstDownload];
    
    [self createRefreshView];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
