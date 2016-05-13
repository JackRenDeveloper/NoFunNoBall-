//
//  CustomCell.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "CustomCell.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)updateleftImage:(NSString *)videoImageUrl{
    if (self.VideoimageView == nil) {
       //图
        self.VideoimageView = [[UIImageView alloc]init];
        self.VideoimageView.frame = CGRectMake(0,150, 300, 100);
        [self.VideoimageView setImageWithURL:[NSURL URLWithString:videoImageUrl] placeholderImage:[UIImage imageNamed:@"zx"]];
        [self addSubview:self.VideoimageView];
    }
}

#pragma mark - updateCellData 
-(void)updateCellData:(DataItem *)item{
    
    //title
    if (self.VideoTitle == nil) {
        self.VideoTitle = [[UILabel alloc]init];
        self.VideoTitle.frame = CGRectMake(0,100,280, 50);
        self.VideoTitle.text = item.title;
        [self addSubview:self.VideoTitle];
    }
    
        //time
        if (self.videoTime == nil) {
            self.videoTime = [[UILabel alloc]init];
            self.videoTime.frame = CGRectMake(40,50,280, 50);
            self.videoTime.text = item.time;
            [self addSubview:self.videoTime];
        }
    
    //short_title
    if (self.short_title == nil) {
        self.short_title = [[UILabel alloc]init];
        self.short_title.frame = CGRectMake(70,20,280, 20);
        self.short_title.text = item.short_title;
        [self addSubview:self.short_title];
    }
    
    //info
    if (self.videoinfo == nil) {
        self.videoinfo = [[UILabel alloc]init];
        self.videoinfo.frame = CGRectMake(0,220,300,230);
        self.videoinfo.numberOfLines = 10;
        self.videoinfo.font = [UIFont systemFontOfSize:20];
        self.videoinfo.text = item.intro;
        [self addSubview:self.videoinfo];
    }


        [self updateleftImage:item.imagelink];
        self.observerItem = item;
        
        [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];

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
