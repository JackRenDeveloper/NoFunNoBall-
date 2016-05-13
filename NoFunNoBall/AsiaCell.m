//
//  AsiaCell.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "AsiaCell.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@implementation AsiaCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)updateCellData:(DataItem *)item{
    
    //title
    
    if (self.title == nil) {
        self.title = [[UILabel alloc]init];
        self.title.frame = CGRectMake(5, 5,300, 50);
        self.title.text = item.title;
        [self addSubview:self.title];
        
        self.observerItem = item;
        
        [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //更新UI
    self.textLabel.text = [object valueForKeyPath:keyPath];
}

-(void)dealloc{
    //移除观察者
    [self.observerItem removeObserver:self forKeyPath:@"title"];
}



@end
