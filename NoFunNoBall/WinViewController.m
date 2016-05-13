//
//  WinViewController.m
//  NoFunNoBall
//
//  Created by qianfeng01 on 15/11/17.
//  Copyright (c) 2015年 Wyuh. All rights reserved.
//

#import "WinViewController.h"
#import "FunList.h"
#import "AFNetworking.h"

@interface WinViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSMutableArray *_created_at;
    NSMutableArray *_text;
    NSMutableArray *_title;
    NSMutableArray *_images;
    
    
}

@end

@implementation WinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详“囍”⚽️or🏀况";
    
    //自定制导航按钮
    [self customNaviItem];
    //创建视图集合
    [self createCollectionView];
    //创建数据源
    [self createData];
    
}

-(void)createCollectionView{
    //创建与屏幕等大的imageView
    UIImage *image = [UIImage imageNamed:@"fun.jpeg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = image;
    
    [self.view addSubview:imageView];
    
    CGRect frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20);
    _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:[self customLayout]];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.bounces = NO;//反弹
    _collectionView.backgroundView = imageView;
    
    //设置代理
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //注册item复用标识及类型
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    [self.view addSubview:_collectionView];
    
}

-(UICollectionViewFlowLayout *)customLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 10;
    layout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-20);
    
    return layout;
    
}
-(void)createData{
    _created_at = [[NSMutableArray alloc]init];
    _text = [[NSMutableArray alloc]init];
    _title = [[NSMutableArray alloc]init];
    _images = [[NSMutableArray alloc]init];
    
    NSString *timeStr = [FunList shareInstance].item.pubtime;
    NSString *textStr = [FunList shareInstance].item.text;
    NSString *titleStr = [FunList shareInstance].item.title;
    UIImageView *ballImageView = [[UIImageView alloc]init];
    [ballImageView setImageWithURL:[NSURL URLWithString:[FunList shareInstance].item.imageUrl] placeholderImage:[UIImage imageNamed:@"fbg.jpeg"]];
    
    [_created_at addObject:timeStr];
    [_text addObject:textStr];
    [_title addObject:titleStr];
    [_images addObject:ballImageView];
    
}

#pragma mark - 数据源代理必须的两个代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _title.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    CGSize size = cell.frame.size;
    //时间
    UILabel *createdLabel = [[UILabel alloc]init];
    createdLabel.text = _created_at[indexPath.item];
    createdLabel.frame = CGRectMake(0, 0, self.view.frame.size.width/2, 50);
    createdLabel.center = CGPointMake(size.width*3/4,115);
    createdLabel.backgroundColor = [UIColor yellowColor];
    createdLabel.textAlignment = NSTextAlignmentCenter;
    createdLabel.numberOfLines = 1;
    createdLabel.adjustsFontSizeToFitWidth = YES;
    createdLabel.layer.borderColor = [[UIColor redColor]CGColor];
    createdLabel.layer.borderWidth = 2;
    [cell addSubview:createdLabel];
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = _title[indexPath.item];
    titleLabel.frame = CGRectMake(0, 0, self.view.frame.size.width/2, 50);
    titleLabel.center = CGPointMake(size.width/4, 115);
    titleLabel.backgroundColor = [UIColor redColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 1;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.layer.borderColor = [[UIColor greenColor]CGColor];
    titleLabel.layer.borderWidth = 2;
    [cell addSubview:titleLabel];
    
    //给每个item添加图片
    UIImageView *ballImageVIew = [[UIImageView alloc]init];
    ballImageVIew = _images[indexPath.item];
    ballImageVIew.frame = CGRectMake(0, 0, size.width, size.width/3+66);
    ballImageVIew.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/3+10);
    [cell addSubview:ballImageVIew];
    
    //给每个item添加内容
    UILabel *textLabel = [[UILabel alloc]init];
    textLabel.text = _text[indexPath.item];
    textLabel.frame = CGRectMake(0,0, size.width, size.height/3+20);
    textLabel.center = CGPointMake( self.view.frame.size.width/2,  self.view.frame.size.height*2/3);
    textLabel.backgroundColor = [UIColor greenColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.numberOfLines = 0;
    textLabel.adjustsFontSizeToFitWidth = YES;
    textLabel.layer.borderColor = [[UIColor blueColor]CGColor];
    textLabel.layer.borderWidth = 2;
    [cell addSubview:textLabel];
    
    return cell;
}

-(void)customNaviItem{
    //设置右侧的item
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    //设置title
    [rightBtn setTitle:@"返根" forState:UIControlStateNormal];
    //设置title颜色
    [rightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //设置button的背景图
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"right_btn"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(onReturnToRoot) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}
-(void)onReturnToRoot{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
