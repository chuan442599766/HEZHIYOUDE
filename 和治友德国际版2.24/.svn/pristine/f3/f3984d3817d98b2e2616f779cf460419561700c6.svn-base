//
//  cuxiaoViewController.m
//  和治友德国际版
//
//  Created by 刘震 on 17/2/27.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "cuxiaoViewController.h"

@interface cuxiaoViewController ()<UITextFieldDelegate>
{
    NSInteger typeInt;
    MCDropDownView *dropDownView;
}

@end

@implementation cuxiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.waibuview.layer.cornerRadius=4.0;
    self.surebtn.layer.cornerRadius=4.0;
    self.title=@"促销";
    UIColor*color=[UIColor whiteColor];
    NSDictionary*dic=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes=dic;
    UIButton*leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;
}


-(void)niDropDownDelegateMethod:(MCDropDownView *)sender content:(NSString *)string row:(NSInteger)row
{
    [self rel];
    switch (typeInt) {
        case 1:
            if ([string isEqualToString:@"1+5(四周内)"] || [string isEqualToString:@"2+5(四周后)"]||[string isEqualToString:@"1+6(不限制)"]||[string isEqualToString:@"180(不限制)"] ) {
                self.cuxiaoleixingtext.text=string;
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

- (IBAction)cuxiaotypeaction:(id)sender {
    UIButton *button=(UIButton*)sender;
    typeInt=1;
    NSArray *arr = [NSArray arrayWithObjects:@"1+5(四周内)", @"2+5(四周后)",@"1+6(不限制)",@"180(不限制)",nil];
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
@end
