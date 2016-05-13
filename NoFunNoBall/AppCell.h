//
//  AppCell.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

@interface AppCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIImageView *HomeLogo;

@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UIImageView *PlayLogo;

@property (weak, nonatomic) IBOutlet UIImageView *AwayLogo;

@property (nonatomic)NSString *match_id;

@property (nonatomic)NSString *type;
-(void)updateData:(AppModel *)model indexPath:(NSIndexPath *)indexpath type:(NSString *)type;
//当前页面
@property (nonatomic) NSString *currentPage;


@end
