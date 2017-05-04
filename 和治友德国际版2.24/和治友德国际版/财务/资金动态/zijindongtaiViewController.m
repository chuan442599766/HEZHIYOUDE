//
//  zijindongtaiViewController.m
//  和治友德国际版
//
//  Created by 刘震 on 17/2/27.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "zijindongtaiViewController.h"
#import "zijindongtaiTableViewCell.h"
#import "zijindongtaixiangqingViewController.h"
#import "SelectAlert.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+XMG.h"
@interface zijindongtaiViewController ()

@end

@implementation zijindongtaiViewController
{
    NSArray*titles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"资金动态";
    NSString*language=[[NSUserDefaults standardUserDefaults]objectForKey:@"myLanguage"];
    NSLog(@"%@",language);
    if ([language isEqual:@"en"]) {
        self.title=@"Capital dynamics";
    }
    if ([language isEqual:@"fr"]) {
        self.title=@"Dynamique de fonds";
    }

    UIButton*leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;
    UIButton*rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [rightButton setTitle:@"筛选" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(shaixuan:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
    titles=@[@"转账",@"理财",@"购物",@"缴费",@"提现",@"充值"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 18;
    
}
-(void)shaixuan:(id)sender
{
    NSLog(@"筛选");
    [SelectAlert showWithTitle:@"请选择筛选类型" titles:titles selectIndex:^(NSInteger selectIndex) {
        NSLog(@"选择了第%ld个",selectIndex);
    } selectValue:^(NSString *selectValue) {
        NSLog(@"选择的值为%@",selectValue);
        [MBProgressHUD showMessage:@"正在加载筛选结果..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];
            [MBProgressHUD hideHUD];
        });
    } showCloseButton:NO];
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*identifier=@"zijindongtaiTableViewCell";
    zijindongtaiTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
//        [cell setBackgroundColor:[UIColor clearColor]];
    }
//    cell.userInteractionEnabled=NO;
    tableView.separatorStyle = NO;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"跳转");
    zijindongtaixiangqingViewController*zijindongtai=[[zijindongtaixiangqingViewController alloc]init];
    [self.navigationController pushViewController:zijindongtai animated:YES];
    
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
