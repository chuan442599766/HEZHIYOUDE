//
//  MadeOrderViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/28.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "MadeOrderViewController.h"
static NSString * const addressCell = @"addressCell";
static NSString * const cell2 = @"cell2";
static NSString * const cell3 = @"cell3";
static NSString * const cell4 = @"cell4";
static NSString * const cell5 = @"cell5";
@interface MadeOrderViewController ()<UITableViewDelegate>

@end

@implementation MadeOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 5;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.row == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addressCell forIndexPath:indexPath];
        return cell;
        
        
    }else if (indexPath.row == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell2 forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.row == 2)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell3 forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.row == 3)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell4 forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.row == 4)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell5 forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 86;
        
    }else if (indexPath.row == 1){
        
        return 181;
        
    }
    return 49;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1f;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1f;
    
}
- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
