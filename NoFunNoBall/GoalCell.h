//
//  GoalCell.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataItem.h"

@interface GoalCell : UITableViewCell

-(void)updatImage:(NSString *)bigImage;

-(void)updateCellData:(DataItem *)item;

@property(nonatomic,strong)DataItem *observerItem;

@property(nonatomic,strong)UIImageView *bigImageView;
@property(nonatomic,strong)UILabel *name;


@end
