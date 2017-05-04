//
//  MemberInformationViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/28.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "MemberInformationViewController.h"
#import "PersonCellTableViewCell.h"
static NSString *const cell1 = @"cell1";
static NSString *const cell2 = @"cell2";
@interface MemberInformationViewController ()
@property (nonatomic, strong)NSArray *CellTitleArray;
@property (nonatomic ,strong)NSArray *CellContentArray;
@end

@implementation MemberInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.CellTitleArray.count +1;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.row == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cell1 forIndexPath:indexPath];
        return cell;
        
    }
    PersonCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell2 forIndexPath:indexPath];
    cell.cellContent.text = self.CellContentArray[indexPath.row-1];
    cell.cellTitle.text = self.CellTitleArray[indexPath.row -1];
    
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 95;
    }
    return 63;
    
}
- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSArray *)CellContentArray{
    
    if (!_CellContentArray) {
        
        _CellContentArray =@[@"S7898566",@"15888888888",@"13048119902123345",@"S78878785",@"S7898560"];
    }
    return _CellContentArray;
    
}
- (NSArray *)CellTitleArray{
    
    if (!_CellTitleArray) {
        
        _CellTitleArray = @[@"用户名",@"手机号",@"身份证",@"推荐人",@"安置人"];
    }
    
    return _CellTitleArray;
    
}

@end
