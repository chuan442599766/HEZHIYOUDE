//
//  ProductViewController.m
//  和治友德
//
//  Created by Mac on 16/12/13.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductTableViewCell.h"
#import "ProductCollectionViewCell.h"
static  NSString * const indetifier = @"cell";
static  NSString * const indtifierCollectionCell = @"collectionCell";

@interface ProductViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{

}
@property (weak, nonatomic) IBOutlet UICollectionView *customCollectionView;
@property (nonatomic ,strong) NSArray *CelltitleArray;
@property (nonatomic, assign)NSInteger selectCell;
@property (weak, nonatomic) IBOutlet UIScrollView *CateScrollview;
@property (nonatomic,assign) NSInteger  selectedIndex;
@property (nonatomic,strong) NSMutableArray * titles;
@property (nonatomic,assign) NSInteger  preSelectedIndex;
@property (nonatomic, strong) UIButton *selectBtn;
//左侧滑动按钮分类数组
@property (nonatomic, strong) NSArray  *productTitleArray;
@property (nonatomic, strong) UIView *selectedView;

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setCatescrolview];
   
}
- (void)setCatescrolview{
    
    for (int i=0; i<7; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat buttonHeight = self.CateScrollview.bounds.size.height /9;
        button.frame = CGRectMake(0, buttonHeight *i, self.CateScrollview.bounds.size.width, buttonHeight);
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:self.CelltitleArray[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.CateScrollview addSubview:button];
        [self.titles addObject:button];
        if (i == 0) {
            UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(2, button.center.y - 10, 2, 20)];
            centerView.backgroundColor = [UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1];
            [self.CateScrollview addSubview:centerView];
            self.selectedView = centerView;
            
            [button setTitleColor:[UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:18];
            
            _selectBtn = button;
            
            
        }
        
        
        
    }
}
- (void)btnClickAction:(UIButton *)button{
    
//    NSLog(@"button,tag == %ld",button.tag);
    if (button != _selectBtn ) {
        
        [button setTitleColor:[UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        self.selectedView.backgroundColor = [UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1];
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.selectedView.frame = CGRectMake(2, button.center.y - 10, 2, 20);

        
        }];
        
        
        [_selectBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _selectBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        _selectBtn = button;
        
        [self.customCollectionView reloadData];
        
    }
   
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.productTitleArray[_selectBtn.tag] count];
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"ProductHomeViewController" bundle:nil];
    UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"proDetal"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indtifierCollectionCell forIndexPath:indexPath];
    cell.imageCell.image = [UIImage imageNamed:self.productTitleArray[_selectBtn.tag][indexPath.row]];
    cell.titleLabel.text = self.productTitleArray[_selectBtn.tag][indexPath.row];
    
    return cell;
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString * OrderTopicItemHeaderId = @"collectionHeadV";
    
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:OrderTopicItemHeaderId forIndexPath:indexPath];
        
        reusableView = header;
    }
    
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;{
    
    CGFloat wight = self.customCollectionView.bounds.size.width;
    
    return CGSizeMake(wight / 3 - 10, 140);
    
}
#pragma mark －－－－－－－－－－－－－－－－－－懒加载－－－－－－－－－－－－－－－－－－－－－－－－－
- (NSArray *)productTitleArray{
    
    if (!_productTitleArray) {
        
        _productTitleArray = @[@[@"3D远红磁性床垫",@"加湿型空气净化器",@"矿泉直饮机",@"矿石能量发热包",@"生态磁多功能养生床垫"],
                               @[@"健康磁性护颈",@"健康磁性护腰",@"健康护膝",@"健康女内裤",@"FOHOW卫生巾组合装"],
                               @[@"草本艾香包",@"负离子远红外养生被",@"和治友德产品系列套组",@"活性肽焕颜多效面膜",@"气血温通养生仪"],
                               @[@"和泰粉",@"和治友德口服液",@"酵粹植物蛋白固体饮料",@"康欣即食谷物粉",@"康益复合果蔬粉固体饮料"],
                               @[@"康元复合果蔬粉固饮料",@"六味茶"],
                               @[@"玫瑰寡糖",@"南新钙片"],
                               @[@"南新甘氨酸钙片",@"吾媚复合果汁饮料"]];
        
    }
    return _productTitleArray;
    
}

- (NSArray *)CelltitleArray{
    
    if (!_CelltitleArray) {
        
        _CelltitleArray = @[NSLocalizedString(@"保健器材", nil),
                            NSLocalizedString(@"保洁护品", nil),
                            NSLocalizedString(@"化妆品", nil),
                            NSLocalizedString(@"保健药品", nil),
                            NSLocalizedString(@"健康饮品", nil),
                            NSLocalizedString(@"健康含片", nil),
                            NSLocalizedString(@"其他", nil)];
        
        
        
    }
    return _CelltitleArray;
    
}
@end
