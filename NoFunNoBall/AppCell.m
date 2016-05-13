//
//  AppCell.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"
#import "Define.h"
#import <UIKit+AFNetworking.h>
@implementation AppCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)updateData:(AppModel *)model indexPath:(NSIndexPath *)indexpath type:(NSString *)type{
    if ([type isEqualToString:kLimitType]) {
        //标题
        self.title.text = model.league;
        //图片
        [self.HomeLogo setImageWithURL:[NSURL URLWithString:model.team1_logo] placeholderImage:[UIImage imageNamed:@"文章列表缺省图@2x"]];
        // 内容比赛双方
        self.desc.text = model.match_name;
        //客队图片
        [self.AwayLogo setImageWithURL:[NSURL URLWithString:model.team2_logo] placeholderImage:[UIImage imageNamed:@"文章列表缺省图@2x"]];
        //时间
        self.time.text = model.time;
        //小图
        [self.PlayLogo setImageWithURL:[NSURL URLWithString:model.league_logo] placeholderImage:[UIImage imageNamed:@"文章列表缺省图@2x"]];
        
        self.match_id = model.match_id;
        
    }
}

@end
