//
//  InformationViewController.m
//  和治友德
//
//  Created by Mac on 16/12/13.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "InformationViewController.h"
#import "HZYDHead.pch"
#import "barScrollview.h"
#import "NewDetailViewController.h"
#import "informatNewsListCell.h"
@interface InformationViewController ()<LBImageTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@property (nonatomic, assign) NSInteger SelectRow;
@property (nonatomic, strong) NSArray *titleArray;


@property (nonatomic, strong) NSArray *NewsTitleArray;
@property (nonatomic, strong) NSArray *NewsImageArray;


@end

@implementation InformationViewController
-(void)viewWillAppear:(BOOL)animated

{
    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
//    self.hidesBottomBarWhenPushed = YES;
//        self.tabBarController.tabBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated

{
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
//    self.tabBarController.tabBar.hidden = YES;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    
    

    
//    self.fd_prefersNavigationBarHidden = NO;
//    [self.view addSubview:self.barScrollview];
    
}
- (NSArray *)NewsTitleArray{
    
    if (!_NewsTitleArray) {
        
        _NewsTitleArray = @[@"直销进入高速发展期，还有一大波利好来袭...",@"党媒首次对直销业重点关注，你还对直销抱有偏见?",@"直销不要做熟人市场，找到志同道合的人更重要",@"马云:电子商务将消失，五大变革引领未来",@"直销行业领衔“新零售”"];
    }
    return _NewsTitleArray;
    
}
- (NSArray *)NewsImageArray{
    
    if (!_NewsImageArray) {
        
        _NewsImageArray = @[@"circle5",@"circle6",@"circle7",@"circle8",@"circle9"];
        
    }
    return _NewsImageArray;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
     if (section == 1){
        
        return 5;
        
    }
    return 1;

}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (!indexPath.section) {

        LBImageTableViewCell *cell  = [LBImageTableViewCell CellWithTableview:tableView];
        cell.delegate               = self;

        return cell;

    }else if (indexPath.section == 1) {
        static NSString *indetifier = @"TabViewcell1";

        informatNewsListCell * cell      = [tableView dequeueReusableCellWithIdentifier:indetifier];
        
        cell.titleLabel.text = self.NewsTitleArray[indexPath.row];
        cell.NewsImage.image = [UIImage imageNamed:self.NewsImageArray[indexPath.row]];
        return cell;

    }else if (indexPath.section == 2) {
        static NSString *indetifier = @"TabViewcell2";

        UITableViewCell * cell      = [tableView dequeueReusableCellWithIdentifier:indetifier];

        return cell;

    }

    return nil;



}
- (void)goToNewsDetailVCwith:(NSInteger)selectedRow{

    self.SelectRow = selectedRow;

    [self performSegueWithIdentifier:@"goToNewDetail" sender:nil];

    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"goToNewDetail"]) {

        id segueVC = [segue destinationViewController];

        [segueVC setValue:@(self.SelectRow) forKey:@"SelectRow"];

    }

    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (!indexPath.section) {
        
        return;
        
    }else if (indexPath.section == 1){
        
        self.SelectRow =indexPath.row +5;
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
