//
//  LBImageTableViewCell.m
//  和治友德
//
//  Created by Mac on 16/12/13.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//



#import "LBImageTableViewCell.h"

@interface LBImageTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView           *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flolayout;
@property (nonatomic,strong) UIImageView                * reliefarcImageview;
@property (nonatomic,strong) UIPageControl              *pageControl;
@property (nonatomic,strong) NSArray                    *CircleImageArray;
@property (nonatomic,strong) NSTimer                    *timer;

@end


static const NSInteger Kmultiply = 5000;
static const NSInteger Kcount    = 5;

@implementation LBImageTableViewCell





+ (instancetype)CellWithTableview:(UITableView *)tableview{
    
    NSString *identifier = NSStringFromClass([LBImageTableViewCell class]);
    LBImageTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LBImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupTimer];
        [self setSubView];
    }
    return self;
    
}
- (NSArray *)CircleImageArray{
    
    if (!_CircleImageArray) {
        
        _CircleImageArray = @[@"circle0",@"circle1",@"circle2",@"circle3",@"circle4"];
    }
    return _CircleImageArray;
    
}
- (UICollectionViewFlowLayout *)flolayout{
    if (!_flolayout) {
        
        _flolayout                         = [[UICollectionViewFlowLayout alloc] init];
        _flolayout.minimumInteritemSpacing = 0.0f;
        _flolayout.minimumLineSpacing      = 0.0f;
        _flolayout.scrollDirection         = UICollectionViewScrollDirectionHorizontal;
        
    }
    return _flolayout;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView                                = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flolayout];
        _collectionView.dataSource                     = self;
        _collectionView.delegate                       = self;
        _collectionView.pagingEnabled                  = YES;
        _collectionView.bounces                        = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return _collectionView;
    
}
- (UIImageView *)reliefarcImageview{
    if (!_reliefarcImageview) {
//        _reliefarcImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home-bac"]];
        _reliefarcImageview.userInteractionEnabled = NO;
        
    }
    return _reliefarcImageview;
    
}
- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl                               = [[UIPageControl alloc] init];
        _pageControl.hidesForSinglePage            = YES;
        _pageControl.defersCurrentPageDisplay      = YES;
        _pageControl.numberOfPages                 = Kcount;
        _pageControl.pageIndicatorTintColor        = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.userInteractionEnabled        = NO;
        
    }
    
    return _pageControl;
    
}
- (void)setSubView{
    
    [self.contentView addSubview:self.collectionView];
    [self.contentView addSubview:self.reliefarcImageview];
    [self.contentView addSubview:self.pageControl];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return Kcount *Kmultiply;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.layer.contents = (__bridge id)[UIImage imageNamed:self.CircleImageArray[indexPath.row % 5]].CGImage;
    cell.contentView.layer.backgroundColor = [UIColor redColor].CGColor;
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    

    
    [self.delegate goToNewsDetailVCwith:indexPath.row % 5];
    
    
    NSLog(@"segue 传旨1 ＝＝ %ld",indexPath.row % 5);
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage = ((NSInteger)((scrollView.contentOffset.x + self.contentView.frame.size.width) / self.contentView.frame.size.width) -1) % Kcount;
    
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.timer invalidate];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self setupTimer];
    
}
- (void)setupTimer{
    
    if ([self respondsToSelector:@selector(updateTimer)]) {
        self.timer = [NSTimer timerWithTimeInterval:5.0f target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}
- (void)updateTimer{
    
    NSInteger item = (self.collectionView.contentOffset.x + self.contentView.frame.size.width) * (Kcount *Kmultiply)/ self.collectionView.contentSize.width;
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.flolayout.itemSize = self.contentView.bounds.size;
    self.collectionView.frame = self.contentView.bounds;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:Kcount * Kmultiply *0.5 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    CGFloat reliefarcImageViewX = 0;
    CGFloat reliefarcImageViewH = 50 *[UIScreen mainScreen].bounds.size.width / 320.0f;
    CGFloat reliefarcImageViewY = self.frame.size.height - reliefarcImageViewH;
    CGFloat reliefArcImageViewW = self.frame.size.width;
    self.reliefarcImageview.frame = CGRectMake(reliefarcImageViewX, reliefarcImageViewY, reliefArcImageViewW, reliefarcImageViewH);
    CGFloat pageControlX = 0;
    CGFloat pageControlH = 35;
    CGFloat pageControlY = self.collectionView.bounds.size.height -pageControlH;
    CGFloat pageControlW = self.collectionView.bounds.size.width;
    
    
    self.pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlW, pageControlH);
    
}
+(CGFloat)cellHeight{
    
    return 210 * [UIScreen mainScreen].bounds.size.width / 320.0f
;
    
}
@end
