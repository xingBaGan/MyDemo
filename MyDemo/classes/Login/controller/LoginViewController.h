//
//  LoginViewController.h
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *idtextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordtextfield;
- (IBAction)login:(id)sender;
- (IBAction)regist:(id)sender;
- (IBAction)forget:(id)sender;



@end

NS_ASSUME_NONNULL_END
