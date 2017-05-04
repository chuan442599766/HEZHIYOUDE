//
//  ShopingCarViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/28.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "ShopingCarViewController.h"
static NSString * const Cellindetifier0 = @"cell";
static NSString * const Cellindetifier1 = @"cell1";
@interface ShopingCarViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    BOOL isNO;
}
@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@property (weak, nonatomic) IBOutlet UIButton *sharebutton;
@property (weak, nonatomic) IBOutlet UIButton *shoucangButton;

@end

@implementation ShopingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 1;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell;
    
    if (isNO) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:Cellindetifier1];
        return cell;
        
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:Cellindetifier0];
    
    return cell;
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"找相似" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    editAction.backgroundColor = [UIColor grayColor];
    return @[deleteAction, editAction];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    editingStyle = UITableViewCellEditingStyleDelete;
}
- (IBAction)bianji:(id)sender {
    isNO = !isNO;
    [self.customTableview reloadData];
    
    if (isNO) {
        
        self.sharebutton.hidden = NO;
        self.shoucangButton.hidden = NO;
        return;
        
    }
    self.sharebutton.hidden = YES;
    self.shoucangButton.hidden = YES;
    
    
    
    
}

- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
