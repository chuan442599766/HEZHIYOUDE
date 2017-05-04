//
//  FinanceTableHeadView.m
//  和治友德
//
//  Created by Mac on 17/2/15.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "FinanceTableHeadView.h"
@interface FinanceTableHeadView()


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftTrailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fistBtnLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secBtnTrailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdBtnLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fourBtnLeading;

@end

@implementation FinanceTableHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FinanceTableHeadView class]) owner:nil options:nil] lastObject];
        
    }
    
    return self;
}
- (void)awakeFromNib{
    self.leftTrailing.constant = [UIScreen mainScreen].bounds.size.width / 4;
    self.rightLeading.constant = self.leftTrailing.constant;
    
    self.fistBtnLeading.constant = ([UIScreen mainScreen].bounds.size.width - 45*4) / 8;
    self.secBtnTrailing.constant = self.fistBtnLeading.constant;
    self.thirdBtnLeading.constant = self.fistBtnLeading.constant;
    self.fourBtnLeading.constant = self.fistBtnLeading.constant;
    
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    
}
- (IBAction)btnClickaction:(id)sender {
    UIButton * button = (UIButton*)sender;
    if ([self.delegate respondsToSelector:@selector(performSegueSelectorWithTag:)]) {
        
        [self.delegate performSegueSelectorWithTag:button.tag];
    }
    if (button.tag == 100) {
        
        
        _changeColorBlock();
        
        
        
        
    }

}

- (IBAction)zijindongtaiaction:(id)sender {

    
    NSLog(@"资金动态2");
}
@end
