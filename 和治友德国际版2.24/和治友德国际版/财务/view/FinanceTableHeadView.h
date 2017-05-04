//
//  FinanceTableHeadView.h
//  和治友德
//
//  Created by Mac on 17/2/15.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FinanceTableHeadViewDelegate;
@interface FinanceTableHeadView : UIView
@property (nonatomic,copy)void (^changeColorBlock)();
- (IBAction)btnClickaction:(id)sender;
- (IBAction)zijindongtaiaction:(id)sender;
@property (weak, nonatomic)id<FinanceTableHeadViewDelegate>delegate;
@end
@protocol FinanceTableHeadViewDelegate <NSObject>
@required
- (void)performSegueSelectorWithTag:(NSInteger)btnTag;
@end