//
//  ViewController.m
//  CTView
//
//  Created by qinman on 2017/1/13.
//  Copyright © 2017年 qinman. All rights reserved.
//

#import "ViewController.h"
#import "CTView.h"
#define KSCREEN_WIDTH       ([UIScreen mainScreen].bounds.size.width)
#define KSCREEN_HEIGHT      ([UIScreen mainScreen].bounds.size.height)
#define KNORMAL_TAG         666
#define KBIG_TAG            888

@interface ViewController () <CTViewDelegate>
@property (nonatomic, assign)BOOL isBig;//判断是否是大图显示
@property (nonatomic, strong)UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"ViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    [self collectView];
}

- (void)collectView {
    
    CGFloat w = KSCREEN_WIDTH/4;
    CGFloat h = w;
    CGFloat gap = 7.5f;
    self.picArr = @[
                    @"http://imgsrc.baidu.com/forum/w%3D580/sign=b003f1092f2eb938ec6d7afae56085fe/f68906f41bd5ad6e3920960281cb39dbb4fd3c8b.jpg",
                    @"http://dingyue.nosdn.127.net/HUmviMzhvWnk8YSodNM4ePdQZNSXBNuLN8vXjdzhUPXP31473741315557.jpg",
                    @"http://img.mp.itc.cn/upload/20160719/0e6dac66a2664c7e9f39d836c0750e9b_th.jpg",
                    @"http://imgsrc.baidu.com/forum/w%3D580/sign=b003f1092f2eb938ec6d7afae56085fe/f68906f41bd5ad6e3920960281cb39dbb4fd3c8b.jpg",
                    @"http://dingyue.nosdn.127.net/HUmviMzhvWnk8YSodNM4ePdQZNSXBNuLN8vXjdzhUPXP31473741315557.jpg",
                    @"http://img.mp.itc.cn/upload/20160719/0e6dac66a2664c7e9f39d836c0750e9b_th.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=b003f1092f2eb938ec6d7afae56085fe/f68906f41bd5ad6e3920960281cb39dbb4fd3c8b.jpg",
                    @"http://dingyue.nosdn.127.net/HUmviMzhvWnk8YSodNM4ePdQZNSXBNuLN8vXjdzhUPXP31473741315557.jpg",
                    @"http://img.mp.itc.cn/upload/20160719/0e6dac66a2664c7e9f39d836c0750e9b_th.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=b003f1092f2eb938ec6d7afae56085fe/f68906f41bd5ad6e3920960281cb39dbb4fd3c8b.jpg",
                    @"http://dingyue.nosdn.127.net/HUmviMzhvWnk8YSodNM4ePdQZNSXBNuLN8vXjdzhUPXP31473741315557.jpg",
                    @"http://img.mp.itc.cn/upload/20160719/0e6dac66a2664c7e9f39d836c0750e9b_th.jpg",
                    ];
    [self addCollectionViewWithRect:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) itemSize:CGSizeMake(w, h) edgeInsets:UIEdgeInsetsMake(gap, gap, 0, 0) bgColor:[UIColor whiteColor] data:self.picArr tag:KNORMAL_TAG indexPath:nil];
}

- (void)addCollectionViewWithRect:(CGRect)rect itemSize:(CGSize)itemSize edgeInsets:(UIEdgeInsets)edgeInsets bgColor:(UIColor *)bgColor data:(NSArray *)data tag:(NSInteger)tag indexPath:(NSIndexPath *)indexPath {
    CTView *view = [[CTView alloc] initWithFrame:rect withScrollDirection:self.isBig?UICollectionViewScrollDirectionHorizontal:UICollectionViewScrollDirectionVertical];
    view.backgroundColor = bgColor;
    view.itemSize = itemSize;
    view.edgeInsets = edgeInsets;
    view.imgURLArr = data;
    view.rentDelegate = self;
    view.tag = tag;
    if (indexPath) {
        [view scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        view.pagingEnabled = YES;
    }
    [self.view addSubview:view];
}

- (void)ctView:(CTView *)ctView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.isBig) {
        self.isBig = NO;
        [[self.view viewWithTag:KBIG_TAG] removeFromSuperview];
        [(CTView *)[self.view viewWithTag:KNORMAL_TAG] scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    } else {
        self.isBig = YES;
        [self addCollectionViewWithRect:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT) itemSize:CGSizeMake(KSCREEN_WIDTH, KSCREEN_HEIGHT) edgeInsets:UIEdgeInsetsMake(20, 10, 0, 0) bgColor:[UIColor whiteColor] data:self.picArr tag:KBIG_TAG indexPath:indexPath];
    }
}

@end
