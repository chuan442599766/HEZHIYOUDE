//
//  HtmlFourViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/21.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "HtmlFourViewController.h"
#import "HZYDHead.pch"
static NSString *const cellIdifder = @"cell";
static NSString *const cellIdifder2 = @"cell2";
@interface HtmlFourViewController ()<UITableViewDelegate>

@end

@implementation HtmlFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   
    return 5;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    if (indexPath.row == 0) {
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdifder];
        
        return cell;
        
    }
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdifder2];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 117;
    
}


@end
