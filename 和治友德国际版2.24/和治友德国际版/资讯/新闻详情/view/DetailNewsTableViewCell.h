//
//  DetailNewsTableViewCell.h
//  和治友德国际版
//
//  Created by Mac on 17/2/24.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstContentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *newsDetailImage;

//点赞按钮背景
@property (weak, nonatomic) IBOutlet UIView *likeBackView;

@property (weak, nonatomic) IBOutlet UIView *unlikeBackView;

#pragma mark DetailSecondCell

@property (weak, nonatomic) IBOutlet UILabel *ComentTitle;
@property (weak, nonatomic) IBOutlet UILabel *CommentContent;
@property (weak, nonatomic) IBOutlet UIImageView *CommentheadImage;


@end





