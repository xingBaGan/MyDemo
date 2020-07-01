//
//  RatingControl.h
//  MixTest
//
//  Created by zjc on 2020/3/20.
//  Copyright © 2020年 zjc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RatingControl : UIStackView
//@property (strong,nonatomic) UIImageView* starImage;

-(void)setUpImages:(float) star_number;
@property  (strong,nonatomic) NSMutableArray* star_arry;
@property (nonatomic) float  point;
@end

NS_ASSUME_NONNULL_END
