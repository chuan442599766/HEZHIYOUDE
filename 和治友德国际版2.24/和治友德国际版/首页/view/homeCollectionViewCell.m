//
//  homeCollectionViewCell.m
//  和治友德
//
//  Created by Mac on 16/12/19.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "homeCollectionViewCell.h"

@implementation homeCollectionViewCell
- (void)loadContent{
//    self.cellImageView.image = [UIImage imageNamed:@"p1"];
//    self.cellImageView.bounds = self.frame;
//    self.cellImageView.center = self.center;
    self.cellImageView.alpha = 0.f;
    
    //sdimageView加载图片
    [UIView animateWithDuration:0.5f delay:0.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        self.cellImageView.alpha = 1.f;
        
    } completion:nil];
}
@end
