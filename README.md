# JWWaterfallLayout
瀑布流布局(封装)

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/3275951-d4bc8647bc836091.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

使用方法: 
把demo里面的JWWaterFallLayout文件夹拖进项目即可,
然后用JWWaterFallLayout来创建collection view,
可以修改layout的col属性来设置有多少列, 
可以遵守数据源代理<JWWaterFallLayoutDataSource>后用数据源方法来设置每一个cell的高度

实例代码:
```
JWWaterFallLayout *layout = [[JWWaterFallLayout alloc] init];
layout.minimumLineSpacing = 10;
layout.minimumInteritemSpacing = 10;
layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
layout.col = 4; // 设置列数
layout.dataSource = self;
_collectionV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

#pragma mark - JWWaterfallLayout DataSource
// 设置每个cell的高度
- (CGFloat)waterfallLayoutWithLayout:(JWWaterFallLayout *)layout itemIndex:(NSInteger)index{
    return arc4random_uniform(100) + 150;
}
```
