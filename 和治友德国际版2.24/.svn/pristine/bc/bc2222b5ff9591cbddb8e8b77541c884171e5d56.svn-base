//
//  ProductDetailViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/28.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()<UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *imageScrollView;
@property (nonatomic, strong)UILabel *headLab;
@property (weak, nonatomic) IBOutlet UITableView *customTableview;

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    [self.view addSubview:self.imageScrollView];

    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section == 0) {
        
        return 4;
    }else if (section == 1){
        
        return 2;
    }
    return 1;
    
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = nil;
    
    if (!indexPath.section) {
        
        if (indexPath.row == 0) {
            
             cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
            cell.separatorInset = UIEdgeInsetsZero;
            return cell;
        }else if (indexPath.row ==1){
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell.separatorInset = UIEdgeInsetsZero;
            return cell;
        }else if (indexPath.row ==2){
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell.separatorInset = UIEdgeInsetsZero;
            return cell;
        }else if (indexPath.row ==3){
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
            cell.separatorInset = UIEdgeInsetsZero;
            return cell;
        }
        
    }else if (indexPath.section == 1){
        
        if (indexPath.row == 0) {
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
            cell.separatorInset = UIEdgeInsetsZero;
            return cell;
        }else if (indexPath.row ==1){
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
            cell.separatorInset = UIEdgeInsetsZero;
            return cell;
        }
        
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell7"];
    cell.separatorInset = UIEdgeInsetsZero;
    
    return cell;
    
    
   
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!indexPath.section) {
        if (indexPath.row ==0) {
            
            return 443;
        }else if (indexPath.row == 1 | indexPath.row ==2){
            
            return 59;
            
        }
        
        return 95;
    }else if (indexPath.section == 1){
        
        if (indexPath.row == 0) {
            
            return 59;
        }
        return 104;
        
    }
    
    return 48;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 2) {
        
        return 0.1f;
    }
    return 10.0f;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
        return;
    }else{
        CGFloat offsetY = scrollView.contentOffset.y;
        _headLab.alpha = -offsetY/50;
        _headLab.center = CGPointMake([UIScreen mainScreen].bounds.size.width /2, -10);
        
        if (offsetY <= -75) {
            
            _headLab.text = @"释放，返回详情";
            
        }else{
            
            _headLab.textColor = [UIColor lightGrayColor];
            _headLab.text = @"下拉,返回详情";
        }
    }
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        NSLog(@"_customTableview.contentSize.height == %f",_customTableview.contentSize.height);
        CGFloat valueNum = _customTableview.contentSize.height - self.view.bounds.size.height-20;
        if ((offsetY - valueNum) > 1.f) {
            
            [self goToDetailAnimation];
        }
        
        NSLog(@"-------------customtableview---------");
        
    }else{
        NSLog(@"scrollview contentOffsetY == %f",offsetY);
        
        
        
        if (offsetY <= -80) {
            
            
            NSLog(@"--------------40---------");
            [self backToFirstPageAnimation];
        }
    }
}
- (void)goToDetailAnimation{
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        
        _customTableview.frame = CGRectMake(0, -989, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _imageScrollView.frame = CGRectMake(0, 24, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 76);

        
    } completion:^(BOOL finished) {
        
    }];
}
- (void)backToFirstPageAnimation{
    _headLab.alpha = 0.f;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        _imageScrollView.frame = CGRectMake(0, self.view.bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        _customTableview.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}
- (UILabel *)headLab{
    
    if (!_headLab) {
        
        _headLab = [[UILabel alloc] init];
        _headLab.text = @"上拉,返回详情";
        _headLab.textAlignment = NSTextAlignmentCenter;
        _headLab.font = [UIFont systemFontOfSize:15];
        
    }
    _headLab.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40.f);
    _headLab.alpha = 0;
    _headLab.textColor = [UIColor lightGrayColor];
    return _headLab;
    
}
- (UIScrollView *)imageScrollView{
    
    if (!_imageScrollView) {
        
        _imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height -48)];
        _imageScrollView.showsVerticalScrollIndicator = NO;
        _imageScrollView.bounces = YES;
        _imageScrollView.delegate = self;
        _imageScrollView.contentSize = CGSizeMake(0, 3312);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 3272)];
        imageView.image = [UIImage imageNamed:@"detail"];
        [_imageScrollView addSubview:imageView];
        [_imageScrollView addSubview:self.headLab];
    }
  
    return _imageScrollView;
    
    
}
//加入购物车
- (IBAction)addShoping:(id)sender {
    
    
    [self performSegueWithIdentifier:@"goToshopCar" sender:nil];
    
    
}
//立即购买确认下单
- (IBAction)goToBuy:(id)sender {
    
    [self performSegueWithIdentifier:@"makeSureOrder" sender:nil];
    
}

- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
