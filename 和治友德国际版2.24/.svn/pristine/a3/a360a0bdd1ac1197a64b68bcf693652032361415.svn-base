//
//  CustomHeadView.h
//  直销
//
//  Created by Mac on 16/9/6.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomHeadView;
@protocol CustomHeadViewDelegate <NSObject>

@optional

- (void)customHeadfootView:(CustomHeadView *)CustomHeadView;


@end


@interface CustomHeadView : UITableViewHeaderFooterView

@property (nonatomic,weak)id<CustomHeadViewDelegate>delegate;

//时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//图片
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic)NSInteger section;



- (void)normlStateAnimated:(BOOL)animated;



@end
