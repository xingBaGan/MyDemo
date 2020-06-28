//
//  MMZCHMViewController.m
//  MyDemo
//
//  Created by a on 2020/6/28.
//  Copyright © 2020 good. All rights reserved.
//

#import "MMZCHMViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import  "SVProgressHUD.h"

#import "settingPassWardViewController.h"
@interface MMZCHMViewController ()
{
    UIView *bgView;
    UITextField *phone;                                           //手机号
    UITextField *code;                                            //验证码
    UINavigationBar *customNavigationBar;
    UIButton *yzButton;
}

@property (nonatomic, copy) NSString *oUserPhoneNum;
@property (assign, nonatomic) NSInteger timeCount;
@property (strong, nonatomic) NSTimer *timer;
//验证码
@property (copy, nonatomic) NSString *smsId;

@end

@implementation MMZCHMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTextFields];
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = @"注册 1/3";
    self.navigationController.navigationBarHidden = NO;
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor colorWithRed:240 / 255.0f green:240 / 255.0f blue:240 / 255.0f alpha:1];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn)];
    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    addBtn.tintColor = [UIColor colorWithRed:248 / 255.0f green:144 / 255.0f blue:34 / 255.0f alpha:1];
    [self.navigationItem setLeftBarButtonItem:addBtn];
}

#pragma mark layout_view
- (void)createTextFields
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 75 + 24, self.view.frame.size.width - 90, 30)];
    label.text = @"请输入您的手机号码";
    label.textColor = [UIColor grayColor];
    label.textAlignment = UITextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:13];

    [self.view addSubview:label];
    CGRect frame = [UIScreen mainScreen].bounds;
    bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 110 + 24, frame.size.width - 20, 100)];
    bgView.layer.cornerRadius = 3.0;
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];

    phone = [self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14]
                           placeholder:@"11 位手机号"];
    phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    phone.keyboardType = UIKeyboardTypeNumberPad;
    code = [self createTextFielfFrame:CGRectMake(100, 60, 90, 30) font:[UIFont systemFontOfSize:14]
                          placeholder:@"4 位数字" ];
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    code.secureTextEntry = YES;
    code.keyboardType = UIKeyboardTypeNumberPad;

    UILabel *phonelabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    phonelabel.text = @"手机号";
    phonelabel.textColor = [UIColor blackColor];
    phonelabel.textAlignment = UITextAlignmentLeft;
    phonelabel.font = [UIFont systemFontOfSize:14];

    UILabel *codelabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 62, 50, 25)];
    codelabel.text = @"验证码";
    codelabel.textColor = [UIColor blackColor];
    codelabel.textAlignment = UITextAlignmentLeft;
    codelabel.font = [UIFont systemFontOfSize:14];

    yzButton = [[UIButton alloc]initWithFrame:CGRectMake(bgView.frame.size.width - 100 - 20, 62, 100, 30)];
    //yzButton.layer.cornerRadius=3.0f;
    //yzButton.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    [yzButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [yzButton setTitleColor:[UIColor colorWithRed:248 / 255.0f green:144 / 255.0f blue:34 / 255.0f alpha:1]
                   forState:UIControlStateNormal];
    yzButton.font = [UIFont systemFontOfSize:13];
    [yzButton addTarget:self action:@selector(getValidCode:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:yzButton];

    UIImageView *line1 = [self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width - 40, 1)
                                          imageName:nil color:[UIColor colorWithRed:180 / 255.0f green:180 / 255.0f blue:180 / 255.0f alpha:.3]];

    UIButton *landBtn = [self createButtonFrame:CGRectMake(10,
                                                           bgView.frame.size.height + bgView.frame.origin.y + 30, self.view.frame.size.width - 20, 37) backImageName:nil
                                          title:@"下一步" titleColor:[UIColor whiteColor]    font:[UIFont systemFontOfSize:17] target:self
                                         action:@selector(next)];
    landBtn.backgroundColor = [UIColor colorWithRed:248 / 255.0f green:144 / 255.0f blue:34 / 255.0f alpha:1];
    landBtn.layer.cornerRadius = 5.0f;

    [bgView addSubview:phone];
    [bgView addSubview:code];

    [bgView addSubview:phonelabel];
    [bgView addSubview:codelabel];
    [bgView addSubview:line1];
    [self.view addSubview:landBtn];
}

#pragma mark lisener_func
- (void)clickaddBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getValidCode:(UIButton *)sender
{
    if ([phone.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"亲,请输入注册手机号码"];
        return;
    } else if (phone.text.length < 11) {
        [SVProgressHUD showInfoWithStatus:@"您输入的手机号码格式不正确"];
        return;
    }
    _oUserPhoneNum = phone.text;
    //__weak MMZCHMViewController *weakSelf = self;
    sender.userInteractionEnabled = NO;
    self.timeCount = 60;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduceTime:)
                                                userInfo:sender repeats:YES];
    //不带自定义模版
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phone.text zone:@"86"
                                 result:^(NSError *error) {
        if (!error) {
            //  请求成功
            NSLog(@"请求验证码成功");
        } else {
            // error
            NSLog(@"请求验证码失败");
        }
    }];
}

#pragma mark personal_func

- (void)reduceTime:(NSTimer *)codeTimer
{
    self.timeCount--;
    if (self.timeCount  ==  0) {
        [yzButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        [yzButton setTitleColor:[UIColor colorWithRed:248 / 255.0f green:144 / 255.0f blue:34 / 255.0f alpha:1]
                       forState:UIControlStateNormal];
        UIButton *info =  codeTimer.userInfo;
        info.enabled =  YES;
        yzButton.userInteractionEnabled =  YES;
        [self.timer invalidate];
    } else {
        NSString *str =  [NSString stringWithFormat:@"%lu 秒后重新获取",  self.timeCount];
        [yzButton setTitle:str forState:UIControlStateNormal];
        yzButton.userInteractionEnabled =  NO;
    }
}

- (UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];

    textField.font = font;
    textField.textColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder = placeholder;
    return textField;
}

- (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor
                                                                                           *)color
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    if (color) {
        imageView.backgroundColor = color;
    }
    return imageView;
}

- (UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title
                     titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    if (imageName) {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (font) {
        btn.titleLabel.font = font;
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

//点击下一步时
- (void)next
{
    if ([phone.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"亲,请输入注册手机号码"];
        return;
    } else if (phone.text.length < 11) {
        [SVProgressHUD showInfoWithStatus:@"您输入的手机号码格式不正确"];
        return;
    } else if ([code.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"亲,请输入验证码"];
        return;
    }
    [SMSSDK commitVerificationCode:code.text phoneNumber:phone.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            //  验证成功
            NSLog(@"验证成功");
            settingPassWardViewController *vc = [[settingPassWardViewController alloc]init];
            vc.phone = phone.text;
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            NSLog(@"验证失败");
            [SVProgressHUD showErrorWithStatus:@"验证码错误"];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
