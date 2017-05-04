//
//  HtmlSecondViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/21.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "HtmlSecondViewController.h"
#import "HZYDHead.pch"
static NSString *const cellIdentif = @"cell2";
static NSString *const activityCell = @"activityCell";

@interface HtmlSecondViewController ()<UIScrollViewDelegate>

@end

@implementation HtmlSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return 5;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 4) {
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:activityCell];
        return cell;
        
        
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentif];
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row != 4) {
        
        return 263;
        
    }
    return 63;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat scrollviewHeight = scrollView.frame.size.height;
    CGFloat scrollviewContentSize = scrollView.contentSize.height;
    CGFloat scrollviewOffsetY = scrollView.contentOffset.y;
    
    CGFloat distanHeight = scrollviewContentSize - scrollviewHeight;
    
    if (distanHeight < scrollviewOffsetY ) {
        
        NSLog(@"height = %f,contentoff = %f,contentsize = %f",scrollviewHeight,scrollviewOffsetY,scrollviewContentSize);
        
    }
}
@end
