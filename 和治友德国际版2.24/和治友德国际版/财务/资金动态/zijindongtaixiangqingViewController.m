//
//  zijindongtaixiangqingViewController.m
//  和治友德国际版
//
//  Created by 刘震 on 17/2/27.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "zijindongtaixiangqingViewController.h"

@interface zijindongtaixiangqingViewController ()

@end

@implementation zijindongtaixiangqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"资金动态详情";
    NSString*language=[[NSUserDefaults standardUserDefaults]objectForKey:@"myLanguage"];
    NSLog(@"%@",language);
    if ([language isEqual:@"en"]) {
        self.title=@"Dynamic Details";
    }
    if ([language isEqual:@"fr"]) {
        self.title=@"dynamique";
    }

    UIColor*color=[UIColor whiteColor];
    NSDictionary*dic=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes=dic;
    UIButton*leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
