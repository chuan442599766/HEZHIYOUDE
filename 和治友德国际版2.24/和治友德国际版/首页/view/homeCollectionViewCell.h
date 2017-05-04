//
//  homeCollectionViewCell.h
//  和治友德
//
//  Created by Mac on 16/12/19.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
- (void)loadContent;

@end
