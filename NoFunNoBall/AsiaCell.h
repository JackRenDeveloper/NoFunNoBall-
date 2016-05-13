//
//  AsiaCell.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataItem.h"

@interface AsiaCell : UITableViewCell

-(void)updateCellData:(DataItem *)item;
@property(nonatomic,strong)DataItem *observerItem;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *digest;


@end

