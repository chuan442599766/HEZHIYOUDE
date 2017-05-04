//
//  CustomHeadView.m
//  直销
//
//  Created by Mac on 16/9/6.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CustomHeadView.h"

@implementation CustomHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)buttonClick:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customHeadfootView:)]) {
        
        [self.delegate customHeadfootView:self];
        
    }
    
}

//箭头动画
#pragma To Do tomorrow
- (void)normlStateAnimated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            //        self.transform = CGAffineTransformRotate(self.defaultTransform, M_PI_2);
            CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI);
            
            self.image.transform = transform;
            
            
            
        }];
    }else{
        

            CGAffineTransform transform = CGAffineTransformRotate(self.image.transform, M_PI);
            
            self.image.transform = transform;
            
            
            
            
       
//        self.image.transform = CGAffineTransformMakeRotation(M_PI);
    }
    
    
}


@end
