//
//  CustomCollectionReusableView.m
//  和治友德
//
//  Created by Mac on 17/2/16.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "CustomCollectionReusableView.h"
@interface CustomCollectionReusableView()
@property (weak, nonatomic) IBOutlet UISearchBar *CustomSearchBar;

@end
@implementation CustomCollectionReusableView

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self endEditing:YES];
}
@end
