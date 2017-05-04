//
//  CommentViewController.m
//  和治友德国际版
//
//  Created by Mac on 17/2/23.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "CommentViewController.h"
#import "HZYDHead.pch"

static NSString *const commentCell = @"commentCell";
static NSString *const commentCell2= @"commentCell2";
static NSString *const commentCell3 = @"commentCell3";

@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    int a;
    int b;
    int c;
    
}
//评论textfield
@property (weak, nonatomic) IBOutlet UITextField *commentField;

//评论TextView
@property (weak, nonatomic) IBOutlet UIView *commentsView;

@property (weak, nonatomic) IBOutlet UITableView *customTableview;
@property (copy, nonatomic)  NSString *ComentTitle;
@property (copy, nonatomic)  NSString *CommentContent;
@property (strong, nonatomic)  UIImage *CommentheadImage;


@end

@implementation CommentViewController
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"ComentTitle"];
    [self removeObserver:self forKeyPath:@"CommentContent"];
    [self removeObserver:self forKeyPath:@"CommentheadImage"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self addObserver:self forKeyPath:@"ComentTitle" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld  context:NULL];
    [self addObserver:self forKeyPath:@"CommentContent" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld  context:NULL];
    [self addObserver:self forKeyPath:@"CommentheadImage" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld  context:NULL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardwillshow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
   
}

- (IBAction)showComent:(id)sender {
    
    [self.commentField becomeFirstResponder];
    self.customTableview.userInteractionEnabled = NO;
    
    
}
- (void)keyboardwillshow:(NSNotification *)notification{
    if (self.commentsView.hidden) {
        
        self.commentsView.hidden = NO;
    }
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    CGFloat duration  = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardFrame = [self.view convertRect:keyboardRect fromView:[[UIApplication sharedApplication] keyWindow]];
    CGFloat keyboardHeight = keyboardFrame.size.height;
    NSLog(@"%f",keyboardHeight);
    
    CGRect rect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - keyboardHeight - self.commentsView.frame.size.height,mainScreenWidth, self.commentsView.frame.size.height);
    
    NSLog(@"%@",NSStringFromCGPoint(rect.origin));
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.commentsView.frame = rect;
        
        NSLog(@"%@",NSStringFromCGPoint(rect.origin));
    } completion:nil];
    NSLog(@"%@",NSStringFromCGPoint(rect.origin));
}
- (void)keyboardWillHide:(NSNotification *)notification{
    
    
    
    self.commentsView.hidden = YES;
    
    
    self.customTableview.userInteractionEnabled = YES;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (!section) {
        
        return 2;
    }
    return 10;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
    
    if (!indexPath.section) {
        
        if (!indexPath.row) {
            
            DetailNewsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:commentCell forIndexPath:indexPath];
            cell.ComentTitle.text = self.ComentTitle;
            cell.CommentContent.text = self.CommentContent;
            cell.CommentheadImage.image = self.CommentheadImage;
            
            
            return cell;
            
        }
        cell = [tableView dequeueReusableCellWithIdentifier:commentCell2 forIndexPath:indexPath];
        
        return cell;
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:commentCell3 forIndexPath:indexPath];
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 1) {
            
            return 58;
            
        }
    }
    
    return 150;
    
    
}
#pragma mark -------------------------------------buttonAction----------------------------
- (IBAction)barButtonBackAction:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)buttonAnimationAction:(UIButton *)sender {
    
    if (sender.tag == 0) {
        
        if (a%2 ==0) {
            
            [self.customTableview scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:9 inSection:1] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            
            
            
        }else{
            
            [self.customTableview scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
            
            
            
        }
        
        a++;
        
    }else{
        
        if (sender.tag == 1){
            
            [sender setImage:[UIImage imageNamed:(b%2==0?@"collection":@"news-detai-bottom-collection")] forState:UIControlStateNormal];
            b++;
            
        }else if (sender.tag == 2){
            
            [sender setImage:[UIImage imageNamed:(c%2==0?@"share":@"unshare")] forState:UIControlStateNormal];
            c++;
        }
        
        
        CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        k.values = @[@(0.1),@(1.0),@(1.5)];
        sender.alpha = 0;
        k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
        k.calculationMode = kCAAnimationLinear;
        sender.alpha = 1;
        [sender.layer addAnimation:k forKey:@"SHOW"];
    }

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
    
    
}
@end
