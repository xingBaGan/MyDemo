//
//  appraisewViewControllerTableViewController.h
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"
NS_ASSUME_NONNULL_BEGIN

@interface appraisewViewController : UIViewController
@property (weak, nonatomic) IBOutlet RatingControl *starView;
@property (weak, nonatomic) IBOutlet UITextField *comment_txtfld;
@property (weak, nonatomic) IBOutlet UITextField *username_txtfld;
@property (nonatomic)  NSInteger shopId;

@end

NS_ASSUME_NONNULL_END
