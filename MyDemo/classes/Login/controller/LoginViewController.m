//
//  LoginViewController.m
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import "LoginViewController.h"
#import "SVProgressHUD+LAN.h"
#import "MainTabBarController.h"
#import "UserInfoModel.h"
#import "MMZCHMViewController.h"
#import "forgetPassWardViewController.h"
#import "SWRevealViewController.h"
#import "LeftMenuController.h"
@interface LoginViewController ()<UITextFieldDelegate, UIScrollViewDelegate,SWRevealViewControllerDelegate>
@property (strong,nonatomic) SWRevealViewController* revealView;
@property (strong,nonatomic) UINavigationController* nav;
@property (strong,nonatomic) LeftMenuController* muneView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([[UserInfoModel shareInstance] checkLogin]) {
        //  已登录
        [self showMainViewController];
    }
    self.idtextfield.delegate = self;
    self.passwordtextfield.delegate = self;
    [SVProgressHUD initShareInstance];
    self.idtextfield.text = @"tom";
    self.passwordtextfield.text =@"123456";
    self.revealView.delegate = self;
    
  
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)showMainViewController {
    MainTabBarController *mainTab = [[MainTabBarController alloc] initWithNibName:nil bundle:nil];
    [[UIApplication sharedApplication] delegate].window.rootViewController = mainTab;
}

- (IBAction)login:(id)sender {
    if ([self.idtextfield.text isEqualToString:@"tom"] && [self.passwordtextfield.text
                                                                   isEqualToString:@"123456"]) {
        
        UINavigationController* nav2 = [[UINavigationController alloc]initWithRootViewController:self.muneView];
        [SVProgressHUD showInfoWithStatus:@"登录成功"];
       self.revealView = [[SWRevealViewController alloc]initWithRearViewController:nav2 frontViewController:self.nav];
        
        
        [[UIApplication sharedApplication] delegate].window.rootViewController =self.revealView;
    }
    if ([self.idtextfield.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"请输入你的用户名"];
    }
    if (self.idtextfield.text.length < 3) {
        [SVProgressHUD showInfoWithStatus:@"您输入的用户名格式不正确"];
    }
    if ([self.passwordtextfield.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"密码不能为空"];
    }
}

- (IBAction)regist:(id)sender {
    [self.navigationController pushViewController:[[MMZCHMViewController alloc]init] animated:YES];
}



- (IBAction)forget:(id)sender {
    [self.navigationController pushViewController:[[forgetPassWardViewController alloc]init] animated:YES];
}

#pragma mark delegate
- (id <UIViewControllerAnimatedTransitioning>)revealController:(SWRevealViewController *)revealController animationControllerForOperation:(SWRevealControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if ( operation != SWRevealControllerOperationReplaceRightController )
        return nil;

//    if ( [toVC isKindOfClass:[RightViewController class]] )
//    {
//        if ( [(RightViewController*)toVC wantsCustomAnimation] )
//        {
//            id<UIViewControllerAnimatedTransitioning> animationController = [[CustomAnimationController alloc] init];
//            return animationController;
//        }
//    }

    return nil;
}


//- (SWRevealViewController *)revealView {
//    if (!_revealView) {
//        _revealView = [[SWRevealViewController alloc] init];
//    }
//    return _revealView;
//}

//a view
- (UINavigationController *)nav {
    if (!_nav) {
        MainTabBarController *mainTab = [[MainTabBarController alloc] init];
        UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:mainTab];
        _nav = nav;
    }
    return _nav;
}


- (LeftMenuController *)muneView {
    if (!_muneView) {
        _muneView = [[LeftMenuController alloc] init];
    }
    return _muneView;
}
@end
