//
//  LBImageTableViewCell.h
//  和治友德
//
//  Created by Mac on 16/12/13.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LBImageTableViewCellDelegate;

@interface LBImageTableViewCell : UITableViewCell
@property (nonatomic,weak)id<LBImageTableViewCellDelegate>delegate;

+ (instancetype)CellWithTableview:(UITableView *)tableview;
+(CGFloat)cellHeight;

@end

@protocol LBImageTableViewCellDelegate <NSObject>

- (void)goToNewsDetailVCwith:(NSInteger)selectedRow;


@end