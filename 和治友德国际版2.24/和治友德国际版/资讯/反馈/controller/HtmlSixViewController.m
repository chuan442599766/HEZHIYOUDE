//
//  HtmlSixViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/21.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "HtmlSixViewController.h"
#import "HZYDHead.pch"
@interface HtmlSixViewController ()

@end

@implementation HtmlSixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (!section) {
        return 1;
        
    }
    return 5;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!indexPath.section) {
        
        LBImageTableViewCell *cell = [LBImageTableViewCell CellWithTableview:tableView];
        
        return cell;
        
    }else if (indexPath.section == 1) {
        static NSString *indetifier = @"TabViewcell1";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.section == 2) {
        static NSString *indetifier = @"TabViewcell2";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
    return nil;
    
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (!indexPath.section) {
        
        return;
        
    }
    
    [self performSegueWithIdentifier:@"goToNewDetail" sender:nil];
    
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!indexPath.section) {
        
        return [LBImageTableViewCell cellHeight];
    }else if (indexPath.section == 1){
        
        return 100;
    }
    return 150;
    
}


@end
