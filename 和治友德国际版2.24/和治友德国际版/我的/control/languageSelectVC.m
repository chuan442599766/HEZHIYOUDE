
//
//  languageSelectVC.m
//  和治友德国际版
//
//  Created by Mac on 17/2/24.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "languageSelectVC.h"
#import "CustomTabBarViewController.h"
#import "NSBundle+Language.h"
static NSString *const cellIndetif = @"cell";

@interface languageSelectVC ()<UITableViewDelegate>
{
    
    NSString *languageStr;
    
}
@property (nonatomic, strong)NSIndexPath *lastpath;

@property (nonatomic, strong)NSArray *languageArr;
@property (nonatomic, strong)NSMutableArray *selectArr;

@end
@implementation languageSelectVC
- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    languageStr = @"zh-Hans";
    
}
- (NSArray *)languageArr{
    
    if (!_languageArr) {
        
        _languageArr = @[NSLocalizedString(@"中文", nil),NSLocalizedString(@"英语", nil),NSLocalizedString(@"法语", nil)];
        
    }
    
    return _languageArr;
    
}
- (NSMutableArray *)selectArr{
    
    if (!_selectArr) {
        _selectArr = [NSMutableArray array];
    }
    
    return _selectArr;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.languageArr.count;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndetif];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetif];
    }
    cell.textLabel.text = self.languageArr[indexPath.row];

    
    if (!indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.lastpath = [NSIndexPath indexPathForItem:0 inSection:0];
        
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.lastpath == indexPath) {
        
        return;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:self.lastpath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    UITableViewCell *currentcell = [tableView cellForRowAtIndexPath:indexPath];
    currentcell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.lastpath = indexPath;
    switch (indexPath.row) {
        case 0:
        {
            languageStr = @"zh-Hans";
            
        }
            break;
        case 1:
        {
            languageStr = @"en";
        }
            break;
        case 2:
        {
            languageStr = @"fr";
        }
            break;
            
        default:
            break;
    }
//    NSLog(@"language == str%@",languageStr);
    
    
}
- (IBAction)backAndSaveLanguage:(UIBarButtonItem *)sender {
    
    if (sender.tag == 1) {
        
        [self changeLanguageWithString:languageStr];
        

        
    }

    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"sender.tag == %ld",sender.tag);
    
    
    
}

- (void)changeLanguageWithString:(NSString *)string{
     NSLog(@"language == str%@",languageStr);
    [NSBundle setLanguage:string];
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:@"myLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"CustomTabBarViewController" bundle:[NSBundle mainBundle]];
    
    CustomTabBarViewController *tab = [st instantiateViewControllerWithIdentifier:@"CustomTabBarViewController"];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tab;
    tab.selectedIndex = 4;
    
}
@end
