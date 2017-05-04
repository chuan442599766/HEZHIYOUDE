//
//  AppDelegate+LanguageAppDelegate.m
//  和治友德国际版
//
//  Created by Mac on 17/2/24.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "AppDelegate+LanguageAppDelegate.h"
#import "NSBundle+Language.h"
@implementation AppDelegate (LanguageAppDelegate)

- (void)setLanguage{
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"] && ![[[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"] isEqualToString:@""]) {
        [NSBundle setLanguage:[[NSUserDefaults standardUserDefaults] objectForKey:@"myLanguage"]];
    }
}
@end
