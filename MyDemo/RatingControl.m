//
//  RatingControl.m
//  MixTest
//
//  Created by zjc on 2020/3/20.
//  Copyright © 2020年 zjc. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl

//MARK: Initialization
/**
 *  如果View从xib中加载,就会调用initWithCoder:方法
 *  创建子控件,...
 注意: 如果子控件是从xib中创建,是处于未唤醒状态
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        self.star_arry = [NSMutableArray new];
        [self setUpImages:3.5];
    }
    return self;
}



-(void)setUpImages:(float) star_number{
    self.point = star_number;
    [self removeAllStar];
    UIImage* star_empty= [UIImage imageNamed:@"star_empty"];
    UIImage* star_fill= [UIImage imageNamed:@"star_fill"];
    UIImage* star_half= [UIImage imageNamed:@"star_half"];
    //总共五星
    for(int i=0;i<5;i++){
         UIImageView*  imageView = [[UIImageView alloc]initWithImage:star_fill];
        imageView.translatesAutoresizingMaskIntoConstraints = false;
//        [imageView.heightAnchor constraintEqualToConstant:14.0].active = YES;
//        [imageView.widthAnchor constraintEqualToConstant:14.0].active = YES;
        
        [self.star_arry addObject:imageView];
         [self addArrangedSubview:imageView];
        //设置空心
        if(i>=star_number){
            imageView.image = star_empty;
        }
        
        if(star_number-i>=0.5){
            imageView.image = star_half;
        }
    }
}

-(void)removeAllStar{
    for (UIImageView* star in self.star_arry){
        [star removeFromSuperview];
    }
}
@end
