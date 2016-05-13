//
//  CustomCell.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataItem.h"

@interface CustomCell : UITableViewCell
//图
-(void)updateleftImage:(NSString *)videoImageUrl;

-(void)updateCellData:(DataItem *)item;

@property(nonatomic,strong)DataItem *observerItem;

@property(nonatomic,strong)UIImageView *VideoimageView;

@property(nonatomic,strong)UILabel *VideoTitle;

@property(nonatomic,strong)UILabel *short_title;

@property(nonatomic,strong)UILabel *videoTime;

@property(nonatomic,strong)UILabel *videoinfo;

@end

