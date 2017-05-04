//
//  MCDropDownView.h
//  TIMSystem
//
//  Created by CNFHV on 15-3-11.
//  Copyright (c) 2015年 CNFHV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MCDropDownView;

@protocol MCDropDownDelegate
- (void) niDropDownDelegateMethod: (MCDropDownView *) sender content:(NSString *)string row:(NSInteger)row;
@end

@interface MCDropDownView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) id <MCDropDownDelegate> delegate;

-(void)hideDropDown:(UIButton *)b;
//- (id)showDropDown:(UIButton *)buttonDown height:(CGFloat *)height  array:(NSArray *)arr;
- (id)showDropDown:(UIButton *)buttonDown:(CGFloat *)height:(NSArray *)arr;

@end
