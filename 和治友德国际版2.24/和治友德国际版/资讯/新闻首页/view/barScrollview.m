//
//  barScrollview.m
//  和治友德国际版
//
//  Created by Mac on 17/2/18.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "barScrollview.h"
#import "HZYDHead.pch"

#define btnHeight  40
@interface barScrollview () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,weak) UICollectionView * contentView;
@property (nonatomic,strong) NSMutableArray * subViewControllers;
@property (nonatomic,assign) NSInteger  selectedIndex;
@property (nonatomic,strong) NSMutableArray * titles;
@property (nonatomic,assign) NSInteger  preSelectedIndex;
@property (nonatomic,strong) UIView *selectedView;

@end

@implementation barScrollview
- (NSMutableArray *)titles{
    
    if (!_titles) {
        _titles = [NSMutableArray array];
    }
    return _titles;
}

- (NSMutableArray *)subViewControllers{
    
    if (!_subViewControllers) {
        _subViewControllers = [NSMutableArray array];
    }
    return _subViewControllers;
}
- (instancetype)initWithFrame:(CGRect)frame withtitlArr:(NSArray *)titleArray
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _preSelectedIndex = 0;
        
        self.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:242.0/255.0 blue:248.0/255.0 alpha:1];
        self.contentSize = CGSizeMake(mainScreenWidth, 0);
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        [self setCollectionView];
        CGFloat BtnWidth = [UIScreen mainScreen].bounds.size.width / titleArray.count;
        
        for (int i =0; i< titleArray.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn.frame = CGRectMake(i* BtnWidth, 0, BtnWidth, btnHeight);
            [btn setTitle:titleArray[i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            [self addSubview:btn];
            [self.titles addObject:btn];
            
            if (i == 0) {
                UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, btnHeight-3, BtnWidth -15, 2)];
                centerView.backgroundColor = [UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1];
                [self addSubview:centerView];
                self.selectedView = centerView;
                
                [btn setTitleColor:[UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1] forState:UIControlStateNormal];
                btn.titleLabel.font = [UIFont systemFontOfSize:18];
                
                 _selectBtn = btn;
                
                
            }
            
            
        }
        
        
    }
    return self;
    
}
- (void)setCollectionView{
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //设置layout 属性
    layout.itemSize = (CGSize){self.bounds.size.width,(mainScreenHeight - 144)};
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    UICollectionView * contentView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self addSubview:contentView];
    
    self.contentView = contentView;
    contentView.showsHorizontalScrollIndicator = NO;
    contentView.pagingEnabled = YES;
    contentView.bounces = NO;
    
    contentView.dataSource = self;
    contentView.delegate = self;
    
    //注册cell
    [contentView registerClass:[HYTabbarCollectionCell class] forCellWithReuseIdentifier:@"HYTabbarCollectionCell"];
}
//布局子控件
- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGRect rect = self.bounds;
    self.contentView.frame = CGRectMake(0, 40, rect.size.width,(mainScreenHeight - 144));
}
- (void)addSubItemWithViewController:(UIViewController *)viewController{
    
    [self.subViewControllers addObject:viewController];
    
}
#pragma mark - ************************* 代理方法 *************************
//CollectionViewDataSource方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HYTabbarCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYTabbarCollectionCell" forIndexPath:indexPath];
    
    cell.subVc = self.subViewControllers[indexPath.row] ;
    return cell;
}

- (void)btnClick:(UIButton *)button{
    
    
    if (button != _selectBtn ) {
        
        [button setTitleColor:[UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        
        CGPoint point = CGPointMake(button.center.x,button.center.y + 18);
        
        [UIView animateWithDuration:0.25 animations:^{
            self.selectedView.center = point;
        }];
        
        
        
        [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _selectBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        _selectBtn = button;
        
        
        
    }
    
    if ([self.delegate respondsToSelector:@selector(BarScrollviewBtnClick:WithBtnTag:)] == YES) {
    
        
        [self.barScrollviewDelegate BarScrollviewBtnClick:self WithBtnTag:button];
        
    };
    
    NSLog(@"bttn.tag == %ld",button.tag);
    
    self.contentView.contentOffset = CGPointMake(button.tag * mainScreenWidth,0);
    
}

//UIScrollViewDelegate代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(self.selectedIndex != (scrollView.contentOffset.x + mainScreenWidth * 0.5) / mainScreenWidth){
        self.selectedIndex = (scrollView.contentOffset.x + mainScreenWidth * 0.5) / mainScreenWidth;
    }
    
    
    
}

#pragma mark - ************************* Private方法 ************************
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    
    
    if (_selectedIndex != selectedIndex) {
        _selectedIndex = selectedIndex;
        //设置按钮选中
        [self itemSelectedIndex:self.selectedIndex];
    }
    NSLog(@"selectindex == %ld",_selectedIndex);
}
- (void)itemSelectedIndex:(NSInteger)index{
    
    UIButton * preSelectedBtn = self.titles[_preSelectedIndex];
    preSelectedBtn.selected = NO;
    _selectedIndex = index;
    _preSelectedIndex = _selectedIndex;
    UIButton * selectedBtn = self.titles[index];
    selectedBtn.selected = YES;
    CGPoint point = CGPointMake(selectedBtn.center.x,selectedBtn.center.y + 18);
    
    
    
    [UIView animateWithDuration:0.25 animations:^{
       
        preSelectedBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        selectedBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [preSelectedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [selectedBtn setTitleColor:[UIColor colorWithRed:56.0/255.0 green:72.0/255.0 blue:235.0/255.0 alpha:1] forState:UIControlStateNormal];
        self.selectedView.center = point;
    }];
    
}
@end
