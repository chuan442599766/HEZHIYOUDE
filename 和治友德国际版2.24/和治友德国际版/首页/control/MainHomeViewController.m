//
//  MainHomeViewController.m
//  和治友德
//
//  Created by Mac on 16/12/8.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "MainHomeViewController.h"
#import "homeCollectionViewCell.h"
#import "CustomCollectionReusableView.h"
#import "AddPointViewController.h"
#import "competencelistViewController.h"
#import "RetailsingleViewController.h"
#import "liuyanfankuiViewController.h"
#import "cuxiaoViewController.h"
#import "buzigedanViewController.h"
@interface MainHomeViewController()<UICollectionViewDelegateFlowLayout,CustomCollectionReusableViewDelegate>



@end
static NSString * const cellIdentif = @"cell";
static NSString * const headerId    = @"headView";

@implementation MainHomeViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    CustomCollectionReusableView*custom=[[CustomCollectionReusableView alloc]init];
    custom.delegate=self;
    UIColor*color=[UIColor whiteColor];
    NSDictionary*dic=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes=dic;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    homeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentif forIndexPath:indexPath];
    
    [cell loadContent];
    
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[UICollectionReusableView alloc] init];
        }
        
        
        return headerView;
    }

    
    return nil;
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 10);
    //
    return insets;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rect = self.view.frame.size.width - 30;

    CGSize size  = CGSizeMake(rect/2, 175);
    
    
    return size;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self endAppearanceTransition];
}
-(void)performSegueSelectorWithTag:(NSInteger)btnTag
{
    switch (btnTag) {
        case 0:
        {
            
            
        }
            break;
          case 1:
        {
            NSLog(@"增加点位");
        }
        default:
            break;
    }
}
//- (IBAction)clickbtnaction:(id)sender {
//    UIButton * button = (UIButton*)sender;
//    if ([self.delegate respondsToSelector:@selector(performSegueSelectorWithTag:)]) {
//        
//        [self.delegate performSegueSelectorWithTag:button.tag];
//    }
//    if (button.tag == 100) {
//        
//        
//        _changeColorBlock();
//        
//        
//        
//        
//    }
//
//}
- (IBAction)goToRegister:(id)sender {
    
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"LoginAndRegisterController" bundle:nil];
    UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"RegistController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}


//促销
- (IBAction)cuxiaoaction:(id)sender {
//    PromotionListViewController*promotion=[[PromotionListViewController alloc]init];
//    [self.navigationController pushViewController:promotion animated:YES];
    cuxiaoViewController*cuxiao=[[cuxiaoViewController alloc]init];
    [self.navigationController pushViewController:cuxiao animated:YES];
}
//增加点位
- (IBAction)zengjiadianweiaction:(id)sender {
    AddPointViewController*addpoint=[[AddPointViewController alloc]init];
    [self.navigationController pushViewController:addpoint animated:YES];
}
//补资格单
- (IBAction)buzigedan:(id)sender {
//    competencelistViewController*competencelist=[[competencelistViewController alloc]init];
//    [self.navigationController pushViewController:competencelist animated:YES];
    buzigedanViewController*buzigedan=[[buzigedanViewController alloc]init];
    [self.navigationController pushViewController:buzigedan animated:YES];
}
//零售单
- (IBAction)lingshoudan:(id)sender {
    RetailsingleViewController*retailsingle=[[RetailsingleViewController alloc]init];
    [self.navigationController pushViewController:retailsingle animated:YES];
}

- (IBAction)liuyanfankui:(id)sender {
    liuyanfankuiViewController*liuyan=[[liuyanfankuiViewController alloc]init];
    [self.navigationController pushViewController:liuyan animated:YES];
}
//账户币种选择
- (IBAction)zhanghubizhongxuanzeact:(id)sender {
    
}
@end
