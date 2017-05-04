//
//  CustomeTableviewCell.h
//  和治友德
//
//  Created by Mac on 16/12/13.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomTableViewCellDelegate;

@interface CustomeTableviewCell : UITableViewCell
@property (nonatomic,weak)id<CustomTableViewCellDelegate>delegate;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lef2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right3;
@end
@protocol CustomTableViewCellDelegate <NSObject>

- (void)buttonAction:(UIButton *)btn;


@end