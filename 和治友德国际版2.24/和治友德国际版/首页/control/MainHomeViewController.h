//
//  MainHomeViewController.h
//  和治友德
//
//  Created by Mac on 16/12/8.
//  Copyright © 2016年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MainHomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

- (IBAction)cuxiaoaction:(id)sender;

- (IBAction)zengjiadianweiaction:(id)sender;
- (IBAction)buzigedan:(id)sender;
- (IBAction)lingshoudan:(id)sender;
- (IBAction)liuyanfankui:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *zengjiadianwei;

@end
