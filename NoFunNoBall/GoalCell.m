//
//  GoalCell.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "GoalCell.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@implementation GoalCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)updatImage:(NSString *)bigImage{
    //大图
    if (self.bigImageView == nil) {
        self.bigImageView = [[UIImageView alloc]init];
        self.bigImageView.frame = CGRectMake(10, 10,350, 100);
        [self.bigImageView setImageWithURL:[NSURL URLWithString:bigImage] placeholderImage:[UIImage imageNamed:@"zx"]];
        [self addSubview:self.bigImageView];
        
    }
    
}


-(void)updateCellData:(DataItem *)item{
    //title
    if (self.name == nil) {
        self.name = [[UILabel alloc]init];
        self.name.frame = CGRectMake(30,105,350, 50);
        self.name.text = item.name;
        [self addSubview:self.name];
        
        [self updatImage:item.thumbSrc];
        
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
