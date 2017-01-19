//
//  CTViewCell.m
//  SouFun
//
//  Created by qinman on 2016/12/14.
//
//

#import "CTViewCell.h"
#import "UIImageView+WebCache.h"

@interface CTViewCell ()
@property (nonatomic, strong)UIImageView *imgView;
@end
@implementation CTViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.imgView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgView];
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
    _edgeInsets = edgeInsets;
    self.imgView.frame = CGRectMake(edgeInsets.left, edgeInsets.top, CGRectGetWidth(self.frame)-edgeInsets.left*2, CGRectGetHeight(self.frame)-edgeInsets.top*2);
}

- (void)setImgURL:(NSString *)imgURL {
    _imgURL = imgURL;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgURL] placeholderImage:[UIImage imageNamed:@"default.png"]];
}
@end
