//
//  DetailNewsTableViewCell.m
//  和治友德国际版
//
//  Created by Mac on 17/2/24.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "DetailNewsTableViewCell.h"
#import "MBProgressHUD+XMG.h"
@implementation DetailNewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.likeBackView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.likeBackView.layer.borderWidth = 1;
    self.likeBackView.layer.masksToBounds = YES;
    self.unlikeBackView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.unlikeBackView.layer.borderWidth = 1;
    self.unlikeBackView.layer.masksToBounds = YES;
}

- (IBAction)buttonAnimation:(UIButton *)sender {

//    if (sender.tag == 3 | sender.tag ==5 | sender.tag == 6){
//        
//        [sender setImage:[UIImage imageNamed:@"thum-up"] forState:UIControlStateNormal];
//        
//        [sender setTitle:[NSString stringWithFormat:@"%d",1] forState:UIControlStateNormal];
//        sender.enabled = NO;
//        
//    }else
        if (sender.tag == 4){
        
            if (sender.selected ==YES) {
                
                [MBProgressHUD showSuccess:@"已点吐槽" toView:nil];
                return;
                
            }
            [sender setImage:[UIImage imageNamed:@"thum-downBL"] forState:UIControlStateNormal];
        
            [sender setTitle:[NSString stringWithFormat:@"%d",1] forState:UIControlStateNormal];
            [MBProgressHUD showSuccess:@"吐槽成功" toView:nil];
            sender.selected = YES;
            
        }else{
            if (sender.selected ==YES) {
                
                [MBProgressHUD showSuccess:@"已点赞" toView:nil];
                return;
                
            }
            [sender setImage:[UIImage imageNamed:@"thum-up"] forState:UIControlStateNormal];
            
            [sender setTitle:[NSString stringWithFormat:@"%d",1] forState:UIControlStateNormal];
            [MBProgressHUD showSuccess:@"点赞成功" toView:nil];
            
            sender.selected = YES;
        }
    
    
    
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.5)];
    sender.alpha = 0;
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    sender.alpha = 1;
    [sender.layer addAnimation:k forKey:@"SHOW"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    
}

@end
