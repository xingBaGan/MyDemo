//
//  AppraiseTableViewCell.h
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppraiseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AppraiseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *appraise;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *starNum;
@property (weak, nonatomic) AppraiseModel* model;


@end

NS_ASSUME_NONNULL_END
