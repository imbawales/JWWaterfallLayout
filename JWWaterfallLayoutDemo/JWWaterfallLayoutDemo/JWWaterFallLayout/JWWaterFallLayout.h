//
//  JWWaterFallLayout.h
//  JWWaterfallLayoutDemo
//
//  Created by apple on 17/4/23.
//  Copyright © 2017年 wales. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JWWaterFallLayout;

@protocol JWWaterFallLayoutDataSource <NSObject>
/**
 *  数据源方法, 用来让外界设置每个cell的高度
 *
 *  @param layout layout对象
 *  @param index  第几个cell
 *
 *  @return cell的高度
 */
- (CGFloat)waterfallLayoutWithLayout:(JWWaterFallLayout *)layout itemIndex:(NSInteger)index;
@end

@interface JWWaterFallLayout : UICollectionViewFlowLayout

/** 列数 (注意: 不设置的话默认为1) */
@property (nonatomic, assign) NSInteger col;

/** 数据源 (注意: 不设置的数据源并且不实现数据源方法的话则每个cell的默认高度为100) */
@property (nonatomic,weak) id<JWWaterFallLayoutDataSource>dataSource;

@end
