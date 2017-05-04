//
//  NewsViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/20.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "NewsViewController.h"
#import "HZYDHead.pch"
#import "InformationViewController.h"

@interface NewsViewController ()<UIScrollViewDelegate,barScrollviewDelegate>
@property (strong, nonatomic) UIScrollView *mainScrollview;
@property (nonatomic, strong) InformationViewController *inforVC;
@property (assign,nonatomic) BOOL adjustScreen;

@property (nonatomic,strong)UIViewController  * currentVC;
@property (nonatomic,strong)HtmlSecondViewController *secondVC;
@property (nonatomic, strong)HtmlThirdViewController *thirdVC;
@property (nonatomic, strong)HtmlFourViewController *fourVC;
@property (nonatomic, strong)HtmlFiveViewController *fiveVC;
@property (nonatomic, strong)HtmlSixViewController *sixVC;

@property (nonatomic, strong)barScrollview *barScr;
@property (nonatomic, strong)NSArray *titleArr;
@property (nonatomic, strong) HYTabbarView *tabbarView;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.barScr];
    
    
}

- (barScrollview *)barScr{
    if (!_barScr) {
        
        _barScr =[[barScrollview alloc] initWithFrame:CGRectMake(0, 0, mainScreenWidth, mainScreenHeight) withtitlArr:[NSArray arrayWithObjects:NSLocalizedString(@"新闻", nil),NSLocalizedString(@"促销", nil),NSLocalizedString(@"公告", nil),NSLocalizedString(@"通知", nil),NSLocalizedString(@"市场调查", nil),nil]];
        _barScr.barScrollviewDelegate = self;
        
        UIStoryboard *st = [UIStoryboard storyboardWithName:@"News" bundle:nil];
        
        self.inforVC = [st instantiateViewControllerWithIdentifier:@"information"];
        NSLog(@"self.inforVC.view.bounds.size.height %f",self.inforVC.view.bounds.size.height);
        
        [_barScr addSubItemWithViewController:self.inforVC];
        [self addChildViewController:self.inforVC];
        
        self.secondVC = [st instantiateViewControllerWithIdentifier:@"HtmlSecondViewController"];
        
        [_barScr addSubItemWithViewController:self.secondVC];
        [self addChildViewController:self.secondVC];
        
        self.thirdVC = [st instantiateViewControllerWithIdentifier:@"HtmlThirdViewController"];
        
        [_barScr addSubItemWithViewController:self.thirdVC];
        [self addChildViewController:self.thirdVC];
        
        self.fourVC = [st instantiateViewControllerWithIdentifier:@"HtmlFourViewController"];
        
        [_barScr addSubItemWithViewController:self.fourVC];
        [self addChildViewController:self.fourVC];
        
        self.fiveVC = [st instantiateViewControllerWithIdentifier:@"HtmlFiveViewController"];
        
        [_barScr addSubItemWithViewController:self.fiveVC];
        [self addChildViewController:self.fiveVC];

        
        
    }
    
    return _barScr;
    
    
}





- (void)BarScrollviewBtnClick:(barScrollview *)barScrollview WithBtnTag:(UIButton *)button{
    
    
    
    
    NSLog(@"button,tag %ld",button.tag);
    
    switch (button.tag) {
        case 100:
        {
            [self replaceController:self.currentVC newController:self.inforVC];
        }
            break;
        case 101:
        {
            [self replaceController:self.currentVC newController:self.secondVC];
        }
            break;
        case 102:
        {
            [self replaceController:self.currentVC newController:self.thirdVC];
        }
            break;
        case 103:
        {
            [self replaceController:self.currentVC newController:self.fourVC];
        }
            break;
        case 104:
        {
            [self replaceController:self.currentVC newController:self.fiveVC];
        }
            break;
        case 105:
        {
            [self replaceController:self.currentVC newController:self.sixVC];
        }
            break;
            
            
        default:
            break;
    }
    
}
- (void)replaceController :( UIViewController  *)oldController  newController :( UIViewController  *)newController{
    
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:2.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
        
        }else{
            
            self.currentVC = oldController;
            
        }
        
    }];
        
}

@end
