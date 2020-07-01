//
//  PostViewController.h
//  MyDemo
//
//  Created by a on 2020/6/30.
//  Copyright © 2020 good. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *shopName_fld;
@property (weak, nonatomic) IBOutlet UITextField *shopDesc_txtfld;
@property (weak, nonatomic) IBOutlet UITextField *time_txtfld;
@property (weak, nonatomic) IBOutlet UITextField *shopAddress_txtfld;
@property (weak, nonatomic) IBOutlet UITextField *spend_txtfld;
@property (weak, nonatomic) IBOutlet UITextField *shopPhone_txtfld;
@property (weak, nonatomic)IBOutlet  UIButton *getType_btn;

@property (weak, nonatomic) IBOutlet UIButton *getPic_btn;
- (IBAction)get_type:(id)sender;
//@property (strong, nonatomic)  UIButton *post_btn;


@end

NS_ASSUME_NONNULL_END
