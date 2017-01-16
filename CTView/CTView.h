//
//  CTView.h
//  SouFun
//
//  Created by qinman on 2016/12/14.
//
//

#import <UIKit/UIKit.h>
#import "CTViewCell.h"

@protocol CTViewDelegate;

@interface CTView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign)CGSize itemSize;
@property (nonatomic, assign)UIEdgeInsets edgeInsets;
@property (nonatomic, strong)NSArray *imgURLArr;//图片数组
@property (nonatomic, weak)id<CTViewDelegate> rentDelegate;
//3.0查看备件信息时，设置为水平滚动；因此补充一个方法，将滚动方向作为参数
- (instancetype)initWithFrame:(CGRect)frame withScrollDirection:(UICollectionViewScrollDirection)scrollDirection;
@end

@protocol CTViewDelegate <NSObject>

- (void)ctView:(CTView *)ctView didSelectItemAtIndexPath:(NSIndexPath *)indexPath ;

@end
