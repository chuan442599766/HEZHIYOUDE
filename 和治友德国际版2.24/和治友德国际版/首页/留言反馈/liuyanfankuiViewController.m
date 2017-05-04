//
//  liuyanfankuiViewController.m
//  和治友德国际版
//
//  Created by 刘震 on 17/2/25.
//  Copyright © 2017年 com.zhichuang.hezhiyoude. All rights reserved.
//

#import "liuyanfankuiViewController.h"
#import "SelectAlert.h"
@interface liuyanfankuiViewController ()

@end

@implementation liuyanfankuiViewController
{
    NSArray*titles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"留言反馈";
    UIColor*color=[UIColor whiteColor];
    NSDictionary*dic=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes=dic;

    UIButton*leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;

//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(tijiao:)];
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,60,30)];
    [rightButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [rightButton addTarget:self action:@selector(tijiao:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;

    titles = @[@"功能意见",@"页面意见",@"您的新需求",@"操作意见",@"流量问题",@"其他"];
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {//检测到“完成”
        [textView resignFirstResponder];//释放键盘
        return NO;
    }
    if (self.liuyantext.text.length==0){//textview长度为0
        if ([text isEqualToString:@""]) {//判断是否为删除键
            self.tishilabel.hidden=NO;//隐藏文字
        }else{
            self.tishilabel.hidden=YES;
        }
    }else{//textview长度不为0
        if (self.liuyantext.text.length==1){//textview长度为1时候
            if ([text isEqualToString:@""]) {//判断是否为删除键
                self.tishilabel.hidden=NO;
            }else{//不是删除
                self.tishilabel.hidden=YES;
            }
        }else{//长度不为1时候
            self.tishilabel.hidden=YES;
        }
    }
    return YES;
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tijiao:(id)sender
{
       UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"感谢您的提交,我们已将您的建议发送给后台并进行系统的统计。"delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil, nil];
    [alertview show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)fankuitype:(id)sender {
//    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"你根本不是老司机,请进行认证"delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"好的", nil];
//    
//    [alertview show];
    [SelectAlert showWithTitle:@"请选择反馈类型" titles:titles selectIndex:^(NSInteger selectIndex) {
        NSLog(@"选择了第%ld个",selectIndex);
    } selectValue:^(NSString *selectValue) {
        NSLog(@"选择的值为%@",selectValue);
//        self.titleLabel.text = selectValue;
        self.yijianlabel.text=selectValue;
    } showCloseButton:NO];
}
@end
