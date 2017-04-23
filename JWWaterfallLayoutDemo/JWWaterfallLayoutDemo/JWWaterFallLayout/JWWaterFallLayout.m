//
//  JWWaterFallLayout.m
//  JWWaterfallLayoutDemo
//
//  Created by apple on 17/4/23.
//  Copyright © 2017年 wales. All rights reserved.
//

#import "JWWaterFallLayout.h"

@interface JWWaterFallLayout ()

@property (nonatomic, strong)NSMutableArray *attributesArr;

@property (nonatomic, assign)CGFloat maxH;

@end

@implementation JWWaterFallLayout

- (NSMutableArray *)attributesArr{
    if (!_attributesArr) {
        _attributesArr = [NSMutableArray array];
    }
    return _attributesArr;
}

// 准备好所有cell的布局
- (void)prepareLayout{
    // cell的frame由collectionViewLayoutAttributes决定
    
    // 1.获取cell的个数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    // 2.遍历所有cell, 给每个cell设定一个attribute
    NSInteger col = 1;
    if (self.col) {
        col = self.col;
    }
    
    CGFloat itemW = (self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right - (col - 1) * self.minimumInteritemSpacing) / col;
    
    // 用一个数组保存每一列的总高度
    NSNumber *height = [NSNumber numberWithFloat:self.sectionInset.top];
    NSMutableArray *heights = [NSMutableArray array];
    for (int i = 0; i < col; i ++) {
        [heights addObject:height];
    }
    
    for (NSInteger i = 0; i < count; i ++) {
        //创建对应的attribute
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        // 给cell设置frame
        CGFloat itemH = 150;
        if (self.dataSource) {
            itemH = [self.dataSource waterfallLayoutWithLayout:self itemIndex:i];
        }
        
          // 取出heights数组里面最小的那个元素和它对应的index
        CGFloat min_value = [[heights valueForKeyPath:@"@min.floatValue"] floatValue];  //最小值
        NSNumber *minH = [NSNumber numberWithFloat:min_value];
        NSInteger minIndex = [heights indexOfObject:minH];
        
        CGFloat itemY = min_value;
        CGFloat itemX = self.sectionInset.left + (self.minimumInteritemSpacing + itemW) * minIndex;
        attribute.frame = CGRectMake(itemX, itemY, itemW, itemH);
        
        // 把attribute保存进数组
        [self.attributesArr addObject:attribute];
        
        // 改变minIndex位置的高度
        heights[minIndex] = [NSNumber numberWithFloat:CGRectGetMaxY(attribute.frame) + self.minimumLineSpacing];
    }
    
    self.maxH = [[heights valueForKeyPath:@"@max.floatValue"] floatValue] - self.minimumLineSpacing;// 最大值
    
}


// 告诉系统准备好的布局
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributesArr;
}

// 告诉系统滚动范围(contentSize)
- (CGSize)collectionViewContentSize{
    return CGSizeMake(0, self.maxH + self.sectionInset.bottom);
}

@end
