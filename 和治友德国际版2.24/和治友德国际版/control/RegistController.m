//
//  RegistController.m
//  和治友德
//
//  Created by Mac on 16/12/19.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "RegistController.h"

@implementation RegistController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
}
//结束编辑
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

//注册按钮
- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)barButtonItemAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
