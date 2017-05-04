//
//  CustomCollectionReusableView.h
//  和治友德
//
//  Created by Mac on 17/2/16.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCDropDownView.h"
@protocol CustomCollectionReusableViewDelegate;

@interface CustomCollectionReusableView : UICollectionReusableView<MCDropDownDelegate>
@property (nonatomic,copy)void (^changeColorBlock)();
@property(weak,nonatomic)id<CustomCollectionReusableViewDelegate>delegate;
- (IBAction)clickbtnaction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *bizhongxianshilabel;
- (IBAction)bizhongtypeaction:(id)sender;


@end
@protocol CustomCollectionReusableViewDelegate <NSObject>
@required
- (void)performSegueSelectorWithTag:(NSInteger)btnTag;


@end