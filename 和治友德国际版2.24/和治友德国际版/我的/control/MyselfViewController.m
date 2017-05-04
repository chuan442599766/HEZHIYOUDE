//
//  MyselfViewController.m
//  和治友德
//
//  Created by Mac on 16/12/13.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "MyselfViewController.h"
#import "HZYDHead.pch"
static NSString *Customcell1 = @"cell1";
static NSString *Customcell2 = @"cell2";
static NSString *Customcell3 = @"cell3";
static NSString *Customcell4 = @"cell4";

@interface MyselfViewController ()<UITableViewDataSource,UITableViewDelegate,CustomTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *imageArr;


@end

@implementation MyselfViewController
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    NSLog(@"123");
    
    return UIStatusBarStyleLightContent;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    

    
}
- (NSArray *)imageArr{
    if (!_imageArr) {
        _imageArr = @[@"search",@"member-information-inquiry",@"adress",@"modify-password-0",@"referral-web",@"placement-network",@"switch-language"];
    }
    
    return _imageArr;
    
}

- (NSArray *)titleArr{
    if (!_titleArr) {
        
       
        NSString *title1 = NSLocalizedString(@"会员资料查询", nil);
        NSString *title7 = NSLocalizedString(@"经营权资料查询", nil);
        NSString *title2 = NSLocalizedString(@"收获地址", nil);
        NSString *title3 = NSLocalizedString(@"修改密码", nil);
        NSString *title4 = NSLocalizedString(@"推荐网", nil);
        NSString *title5 = NSLocalizedString(@"安置网", nil);
        NSString *title6 = NSLocalizedString(@"语言切换", nil);
       
        _titleArr = @[title1,title7,title2,title3,title4,title5,title6];
        
    }
    return _titleArr;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        
        return 2;
        
    }
        
        return self.imageArr.count +1;

    

    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        
        if (indexPath.row ==0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Customcell1 forIndexPath:indexPath];
            
            return cell;
        }
        CustomeTableviewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:Customcell2 forIndexPath:indexPath];
        cell2.delegate = self;
        
        cell2.separatorInset = UIEdgeInsetsZero;
        //
        return cell2;
        
    }else{
        
        if (indexPath.row == self.imageArr.count) {
            
            UITableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:Customcell3 forIndexPath:indexPath];
            //
            return cell4;
        }
        
        UITableViewCell *cell3 = nil;
        
        if (!cell3) {
            
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Customcell4];
            
        }
        cell3.textLabel.text            = self.titleArr[indexPath.row];
        cell3.textLabel.backgroundColor = [UIColor clearColor];
        cell3.clipsToBounds             = YES;
        cell3.layer.shouldRasterize     = YES;
        cell3.layer.rasterizationScale  = [UIScreen mainScreen].scale;
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        cell3.separatorInset            = UIEdgeInsetsZero;
        cell3.imageView.image           = [UIImage imageNamed:self.imageArr[indexPath.row]];
        
        return cell3;
        
    }
        
    
    

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==1) {
        
        if (indexPath.row == 6) {
            
            [self performSegueWithIdentifier:@"languageSelectVC" sender:nil];
            
            
        }else if (indexPath.row == 0){
            
            [self performSegueWithIdentifier:@"MemberInformationViewController" sender:nil];
        }else if (indexPath.row == 1){
            
            [self performSegueWithIdentifier:@"ManagementInformationViewController" sender:nil];
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        
        return 0.1f;
        
    }
    return 0.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!indexPath.section) {
        if (indexPath.row ==0) {
            
            return 90;
            
        }
        return 82;
        
    }
        
    if (indexPath.row == self.imageArr.count) {
            
            return 100;
            
        }
    return 50;
    
    
 
    
    
}
- (void)buttonAction:(UIButton *)btn{
    
    switch (btn.tag) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            [self performSegueWithIdentifier:@"PersonViewController" sender:nil];
            
        }
            break;
        case 2:
        {
            UIStoryboard *st = [UIStoryboard storyboardWithName:@"ProductHomeViewController" bundle:nil];
            
            UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"ShopingCarViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 3:
        {
            UIStoryboard *st = [UIStoryboard storyboardWithName:@"ProductHomeViewController" bundle:nil];
            
            UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"MyOrderViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        default:
            break;
    }
}
- (IBAction)setOut:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginAndRegisterController" bundle:nil];
    
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"loginNav"];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    window.rootViewController = vc;
    
}

@end
