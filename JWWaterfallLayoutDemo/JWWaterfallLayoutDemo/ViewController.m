//
//  ViewController.m
//  JWWaterfallLayoutDemo
//
//  Created by apple on 17/4/23.
//  Copyright © 2017年 wales. All rights reserved.
//

#import "ViewController.h"
#import "JWWaterFallLayout.h"
#import "UIColor+JWRandomColor.h"

static NSString *const ID = @"cellID";

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,JWWaterFallLayoutDataSource>

@property (nonatomic, strong) UICollectionView *collectionV;


@end

@implementation ViewController

#pragma mark - lazy
- (UICollectionView *)collectionV{
    if (!_collectionV) {
        JWWaterFallLayout *layout = [[JWWaterFallLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.col = 4;
        layout.dataSource = self;
        
        _collectionV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        
        _collectionV.backgroundColor = [UIColor whiteColor];
        
        _collectionV.dataSource = self;
        
        _collectionV.delegate = self;
        
        [_collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    }
    return _collectionV;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionV];
}



#pragma mark - collectionView dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 60;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
}



#pragma mark - JWWaterfallLayout DataSource
// 设置每个cell的高度
- (CGFloat)waterfallLayoutWithLayout:(JWWaterFallLayout *)layout itemIndex:(NSInteger)index{
    
    return arc4random_uniform(100) + 150;
}


@end
