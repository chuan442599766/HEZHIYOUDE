//
//  CustomCollectionReusableView.m
//  和治友德
//
//  Created by Mac on 17/2/16.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "CustomCollectionReusableView.h"
#import "AddPointViewController.h"
@interface CustomCollectionReusableView()
@property (weak, nonatomic) IBOutlet UISearchBar *CustomSearchBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation CustomCollectionReusableView
{
    NSInteger typeInt;
    MCDropDownView *dropDownView;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self endEditing:YES];
}
- (IBAction)clickbtnaction:(id)sender {
    UIButton * button = (UIButton*)sender;
    if ([self.delegate respondsToSelector:@selector(performSegueSelectorWithTag:)]) {
        
        [self.delegate performSegueSelectorWithTag:button.tag];
    }
    if (button.tag == 100) {
        
        
        _changeColorBlock();
        
        
        
        
    }
    

}
-(void)niDropDownDelegateMethod:(MCDropDownView *)sender content:(NSString *)string row:(NSInteger)row
{
    [self rel];
    switch (typeInt) {
        case 1:
            if ([string isEqualToString:@"电子币"] || [string isEqualToString:@"PV币"]||[string isEqualToString:@"积分币"]||[string isEqualToString:@"账户币"] ) {
                self.bizhongxianshilabel.text=string;
            }
            break;
            
        default:
            break;
    }
}
-(void)rel{
    dropDownView = nil;
}

- (IBAction)bizhongtypeaction:(id)sender {
    UIButton *button=(UIButton*)sender;

    
    typeInt=1;
    NSArray *arr = [NSArray arrayWithObjects:@"电子币", @"PV币",@"积分币",@"账户币",nil];
    if(dropDownView == nil) {
        CGFloat f = [arr count]*30;
        dropDownView = [[MCDropDownView alloc]showDropDown:button :&f :arr];
        dropDownView.delegate = self;
    }
    else {
        [dropDownView hideDropDown:sender];
        [self rel];
    }

}
@end
