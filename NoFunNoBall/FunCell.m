//
//  FunCell.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "FunCell.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@implementation FunCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)updateImage:(NSString *)imageUrl
{
    if (self.imageView == nil) {
        [self.imageView setImageWithURL:[NSURL URLWithString:imageUrl]];
        
        [self addSubview:self.imageView];
    }
    
    
}

- (void)updateCellData:(DataItem *)item;
{
    
    NSString *hotStr = [[NSString alloc]initWithString:item.identity];
    
    
    self.textLabel.text = [NSString stringWithFormat:@"%@>>>>>%@",hotStr,item.title];
    [self updateImage:item.imageUrl];
    
    self.observerItem = item;
    
    //kvo 注册观察者
    [item addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //更新UI
    self.textLabel.text = [object valueForKeyPath:keyPath];
}

- (void)dealloc
{
    //移除观察者
    [self.observerItem removeObserver:self forKeyPath:@"text"];
}

@end
