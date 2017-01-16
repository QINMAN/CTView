//
//  CTView.m
//  SouFun
//
//  Created by qinman on 2016/12/14.
//
//

#import "CTView.h"
//#import "RentrRevealAccessoryInfoViewController.h"

#define CELL_ID         @"CELL_ID"

@implementation CTView

- (instancetype)initWithFrame:(CGRect)frame
{
    //创建布局对象
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.minimumLineSpacing = 0;
    flowLayOut.minimumInteritemSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayOut];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        //注册单元格
        [self registerClass:[CTViewCell class] forCellWithReuseIdentifier:CELL_ID];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withScrollDirection:(UICollectionViewScrollDirection)scrollDirection {
    //创建布局对象
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    if (scrollDirection == UICollectionViewScrollDirectionVertical || scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        flowLayOut.scrollDirection = scrollDirection;
    }
    flowLayOut.minimumLineSpacing = 0;
    flowLayOut.minimumInteritemSpacing = 0;

    self = [super initWithFrame:frame collectionViewLayout:flowLayOut];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        //注册单元格
        [self registerClass:[CTViewCell class] forCellWithReuseIdentifier:CELL_ID];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imgURLArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CTViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    cell.edgeInsets = self.edgeInsets;
    NSString *urlStr = (NSString *)self.imgURLArr[indexPath.row];
    cell.imgURL = urlStr;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.itemSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - CTViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.rentDelegate respondsToSelector:@selector(ctView:didSelectItemAtIndexPath:)]) {
        [self.rentDelegate ctView:self didSelectItemAtIndexPath:indexPath];
    }
}
@end
