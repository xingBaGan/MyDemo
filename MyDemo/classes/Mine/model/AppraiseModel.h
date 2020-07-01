//
//  AppraiseModel.h
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppraiseModel : NSObject
//@property NSString *shopSpend;
//@property NSString *shopDesc;
//@property NSString *shopPhone;
//@property float *shopLongitude;
//@property float *nameshopLatitude;
@property (nonatomic, assign) NSInteger shopId;
@property (nonatomic, copy) NSString *aappraiseContent;
@property (nonatomic, copy) NSNumber *appraisePoint;
@property (nonatomic, copy) NSString *appraiseImage;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSDate *appraiseTime;
@property (nonatomic, assign) NSInteger appraiseId;
@end

NS_ASSUME_NONNULL_END

