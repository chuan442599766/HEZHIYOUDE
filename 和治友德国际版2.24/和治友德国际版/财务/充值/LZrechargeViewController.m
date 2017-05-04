//
//  LZrechargeViewController.m
//  和治友德国际版
//
//  Created by 刘震 on 17/2/23.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "LZrechargeViewController.h"

@interface LZrechargeViewController ()

@end

@implementation LZrechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.chongzhibtn.layer.cornerRadius=4.0;
    self.title=@"充值";
    NSString*language=[[NSUserDefaults standardUserDefaults]objectForKey:@"myLanguage"];
    NSLog(@"%@",language);
    if ([language isEqual:@"en"]) {
        self.title=@"Recharge";
    }
    if ([language isEqual:@"fr"]) {
        self.title=@"Recharger";
    }

    
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    UIButton*leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;

    self.moneytext.keyboardType=UIKeyboardTypeNumberPad;
    [self.moneytext becomeFirstResponder];
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
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
