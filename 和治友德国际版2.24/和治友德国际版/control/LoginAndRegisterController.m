//
//  LoginAndRegisterController.m
//  和治友德
//
//  Created by Mac on 16/12/8.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "LoginAndRegisterController.h"
#import "CustomTabBarViewController.h"
@implementation LoginAndRegisterController
- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}



-(void)viewWillDisappear:(BOOL)animated

{
    
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}
- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    
    self.userLabel.layer.borderColor       = [UIColor colorWithRed:210.0/255.0 green:214.0/255.0 blue:250.0/255.0 alpha:1].CGColor;
    self.userLabel.layer.borderWidth       = 1.f;
    self.userLabel.layer.cornerRadius      = 20;
    self.userLabel.clipsToBounds           = YES;

    self.passWorldLabel.layer.borderColor  = [UIColor colorWithRed:210.0/255.0 green:214.0/255.0 blue:250.0/255.0 alpha:1].CGColor;
    self.passWorldLabel.layer.borderWidth  = 1.f;
    self.passWorldLabel.layer.cornerRadius = 20;
    self.passWorldLabel.clipsToBounds      = YES;
    
}
//下一个页面(登录)
- (IBAction)sendUserHomeView:(id)sender {
    
    UIStoryboard *storyboard  = [UIStoryboard storyboardWithName:@"CustomTabBarViewController" bundle:nil];

    UIViewController *vc      = [storyboard instantiateViewControllerWithIdentifier:@"CustomTabBarViewController"];

    UIWindow *window          = [UIApplication sharedApplication].keyWindow;

    window.rootViewController = vc;
    
    
}
//下一个页面（注册）
- (IBAction)nextViewController:(id)sender {
    
    [self performSegueWithIdentifier:@"RegistController" sender:self];
    
}
//结束编辑
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleDefault;
    
}
@end
