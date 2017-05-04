//
//  exchangeViewController.m
//  和治友德国际版
//
//  Created by 刘震 on 17/3/1.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "exchangeViewController.h"

@interface exchangeViewController ()<UITextFieldDelegate>
{
     NSInteger typeInt;
    MCDropDownView*dropDownView;
}

@end

@implementation exchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.topbtn.layer.cornerRadius=4.0;
    self.footbtn.layer.cornerRadius=4.0;
    self.title=@"兑换";
    UIButton*leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;
    
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,60,30)];
    [rightButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(tijiao:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
    rightButton.titleLabel.font=[UIFont systemFontOfSize:15];
    self.shuzitext.keyboardType=UIKeyboardTypeNumberPad;
    [self.shuzitext becomeFirstResponder];
    NSString*language=[[NSUserDefaults standardUserDefaults]objectForKey:@"myLanguage"];
    NSLog(@"%@",language);
    if ([language isEqual:@"en"]) {
        self.title=@"exchange";
        self.money.text=@"money";
        self.money.font=[UIFont systemFontOfSize:12];
    }
    if ([language isEqual:@"fr"]) {
        self.title=@"Convertible";
        self.money.text=@"Montant";
        self.money.font=[UIFont systemFontOfSize:12];
    }

}
-(void)niDropDownDelegateMethod:(MCDropDownView *)sender content:(NSString *)string row:(NSInteger)row
{
    [self rel];
    switch (typeInt) {
        case 0:
            if ([string isEqualToString:@"电子账户 f$"] || [string isEqualToString:@"PV账户 fv"]||[string isEqualToString:@"货账户 f000"]||[string isEqualToString:@"积分账户 h000"] ) {
                self.toplabel.text=string;
            }
        break;
           case 1:
            if ([string isEqualToString:@"电子账户 f$"] || [string isEqualToString:@"PV账户 fv"]||[string isEqualToString:@"货账户 f000"]||[string isEqualToString:@"积分账户 h000"] ) {
                self.footlabel.text=string;
            }
            break;
        default:
            break;
    }
}
-(void)rel{
    dropDownView = nil;
}


-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tijiao:(id)sender
{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"是否确认您的本次兑换操作？"delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"确定", nil];
    [alertview show];
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

- (IBAction)topaciton:(id)sender {
    UIButton *button=(UIButton*)sender;
    typeInt=0;
    NSArray *arr = [NSArray arrayWithObjects:@"电子账户 f$", @"PV账户 fv",@"货账户 f000",@"积分账户 h000",nil];
    if(dropDownView == nil) {
        CGFloat f = [arr count]*30;
        dropDownView = [[MCDropDownView alloc]showDropDown:button :&f :arr];
        dropDownView.delegate = self;
    }
    else {
        [dropDownView hideDropDown:sender];
        [self rel];
    }

}

- (IBAction)footaction:(id)sender {
    UIButton *button=(UIButton*)sender;
    typeInt=1;
    NSArray *arr = [NSArray arrayWithObjects:@"电子账户 f$", @"PV账户 fv",@"货账户 f000",@"积分账户 h000",nil];
    if(dropDownView == nil) {
        CGFloat f = [arr count]*30;
        dropDownView = [[MCDropDownView alloc]showDropDown:button :&f :arr];
        dropDownView.delegate = self;
    }
    else {
        [dropDownView hideDropDown:sender];
        [self rel];
    }

}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
@end
