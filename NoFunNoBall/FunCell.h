//
//  FunCell.h
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataItem.h"

@interface FunCell : UITableViewCell

- (void)updateImage:(NSString *)imageUrl;

- (void)updateCellData:(DataItem *)item;

@property (nonatomic,strong) DataItem *observerItem;


@end

