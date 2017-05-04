//
//  CustomTabBarViewController.m
//  和治友德
//
//  Created by Mac on 16/12/8.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "CustomTabBarViewController.h"

@interface CustomTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (UITabBarItem *item in self.tabBar.items) {
        
        item.image         = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       
        
    }
//    [self.tabBar.items objectAtIndex:0].badgeValue = [NSString stringWithFormat:@"%d",2];
//    
//    self.selectedIndex = 2;
//    self.delegate = self;
    self.tabBar.translucent = NO;
    
    
    
}
//- (UIViewController *)childViewControllerForStatusBarStyle{
//    
//    NSLog(@"tabbar selectindex === %ld",self.selectedIndex);
//    
//    return self.viewControllers[4];
//    
//    
//}
@end
