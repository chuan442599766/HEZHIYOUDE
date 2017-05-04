//
//  BonusListViewController.m
//  和治友德国际版
//
//  Created by 刘震 on 17/2/23.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "BonusListViewController.h"
#import "BonusListTableViewCell.h"
#import "CustomHeadView.h"

static NSString *infoHeadFlag = @"CustomHeadView";
static NSString * indetifier = @"cell";
@interface BonusListViewController ()<UITableViewDelegate,UITableViewDelegate,CustomHeadViewDelegate>
{
    BOOL isAnimated;
    
    BOOL floag[3];
}
@property (strong,nonatomic)NSMutableArray *DataArr;
@property (nonatomic,strong)NSMutableArray *sectionCount;

@end

@implementation BonusListViewController
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
    // Do any additional setup after loading the view from its nib.
    self.Mytableview.backgroundColor = [UIColor whiteColor];
    self.Mytableview.showsVerticalScrollIndicator = NO;
    [self.Mytableview registerNib:[UINib nibWithNibName:@"CustomHeadView" bundle:nil] forHeaderFooterViewReuseIdentifier:infoHeadFlag];
    self.Mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.Mytableview setSeparatorColor:[UIColor clearColor]];
    self.title=@"奖金列表";
    NSString*language=[[NSUserDefaults standardUserDefaults]objectForKey:@"myLanguage"];
    NSLog(@"%@",language);
    if ([language isEqual:@"en"]) {
        self.title=@"Bonus list";
    }
    if ([language isEqual:@"fr"]) {
        self.title=@"La liste de bonus";
    }

//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    UIButton*leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;

}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
    
    //    RemittanceRecordUserinfoModel *userInfo = self.DataArr[indexPath.row];
    
    static NSString*identifier=@"BonusListTableViewCell";
    BonusListTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    cell.userInteractionEnabled=NO;
    tableView.separatorStyle = NO;
    
    cell.selectionStyle = NO;
    
    cell.contentView.layer.borderColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1].CGColor;
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0f;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CustomHeadView * headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:infoHeadFlag];
    //    CustomHeadView *headView = [[[NSBundle mainBundle] loadNibNamed:@"CustomHeadView" owner:nil options:nil] lastObject];
    
    headView.delegate = self;
    headView.section =section;
    
    headView.timeLabel.text = @"2017-2-11";
    
    return headView;
    
}
- (void)customHeadfootView:(CustomHeadView *)CustomHeadView{
    
    NSLog(@"custom.tag == %@",self.sectionCount[CustomHeadView.section]);
    
    floag[CustomHeadView.section] = !floag[CustomHeadView.section];
    if (!floag[CustomHeadView.section]) {
        
        
        [self.sectionCount replaceObjectAtIndex:CustomHeadView.section withObject:[NSNumber numberWithBool:NO]];
        
        [CustomHeadView normlStateAnimated:isAnimated];
        [self.DataArr[CustomHeadView.section] removeObjectAtIndex:0];
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:0 inSection:CustomHeadView.section];
        
        [self.Mytableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    }else{
        
        [self.sectionCount replaceObjectAtIndex:CustomHeadView.section withObject:[NSNumber numberWithBool:YES]];
        
        [CustomHeadView normlStateAnimated:isAnimated];
        
        
        [self.DataArr[CustomHeadView.section] addObject:@"1"];
        
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:CustomHeadView.section];
        
        
        [self.Mytableview insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
