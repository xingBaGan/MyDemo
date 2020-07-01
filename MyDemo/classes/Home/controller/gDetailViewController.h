//
//  gDetailViewController.h
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface gDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *shopName;

@property  (strong, nonatomic) UIImageView *image1;
@property  (strong, nonatomic) NSString *renjun1;
@property  (strong, nonatomic) NSString *introduce1;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *introduce;
@property (weak, nonatomic) IBOutlet UILabel *renjun;
@property (nonatomic)NSInteger shopId;
@property  (strong, nonatomic)GoodsModel* model;
-(instancetype)initWithModel:(GoodsModel*)model;


@end

NS_ASSUME_NONNULL_END
