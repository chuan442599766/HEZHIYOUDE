//
//  UpgradeRecordViewController.m
//  直销
//
//  Created by Mac on 16/9/5.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UpgradeRecordViewController.h"
#import "UpgradeRecordTableViewCell.h"
#import "CustomHeadView.h"


static NSString *infoHeadFlag = @"ClassHeaderView";
static NSString * indetifier = @"cell";

@interface UpgradeRecordViewController ()<UITableViewDataSource,UITableViewDelegate,CustomHeadViewDelegate>
{

    BOOL sectionFirstload;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)NSMutableArray *DataArr;
@property (strong,nonatomic) NSMutableArray *sectionCount;


@end

@implementation UpgradeRecordViewController
- (NSMutableArray *)sectionCount{
    if (!_sectionCount) {
        //        根据多少区添加多少bool标记
        //        for (id objc in self.DataArr) {
        //
        //        }
        
        _sectionCount = [NSMutableArray arrayWithObjects:[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO],[NSNumber numberWithBool:NO], nil];
    }
    return _sectionCount;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = NO;

  
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomHeadView" bundle:nil] forHeaderFooterViewReuseIdentifier:infoHeadFlag];
    self.tableView.separatorStyle = 0;
    
    
}
- (NSMutableArray *)DataArr{
    if (!_DataArr) {
        _DataArr = [NSMutableArray arrayWithObjects:[NSMutableArray array],[NSMutableArray array],[NSMutableArray array],nil];
        
    }
    return _DataArr;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

   return [self.DataArr[section] count];
    
 
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UpgradeRecordTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
   
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.layer.borderWidth = 1;
    cell.contentView.layer.borderColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1].CGColor;
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0f;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CustomHeadView * headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:infoHeadFlag];
    headView.delegate = self;
    headView.section = section;

    
    headView.timeLabel.text = @"20111-11-11-11";
    
    return headView;
    
}
- (void)customHeadfootView:(CustomHeadView *)CustomHeadView{

    if ([self.sectionCount[CustomHeadView.section] boolValue]) {
        
        
        
        [CustomHeadView normlStateAnimated:sectionFirstload];
        
        [self.DataArr[CustomHeadView.section] removeObjectAtIndex:0];
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:0 inSection:CustomHeadView.section];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        [self.sectionCount replaceObjectAtIndex:CustomHeadView.section withObject:[NSNumber numberWithBool:NO]];
        
        
    }else{
        
        
        
        [CustomHeadView normlStateAnimated:sectionFirstload];
        
        [self.DataArr[CustomHeadView.section] insertObject:@"1" atIndex:0];
        
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:CustomHeadView.section];
        
        
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        [self.sectionCount replaceObjectAtIndex:CustomHeadView.section withObject:[NSNumber numberWithBool:YES]];
        
    }
    
}

@end
