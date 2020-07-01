//
//  GoodsModel.h
//  MyDemo
//
//  Created by a on 2020/6/29.
//  Copyright © 2020 good. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsModel : NSObject

@property (nonatomic, assign) NSInteger shopId;
@property (nonatomic, copy) NSString *shopImage;
@property (nonatomic, copy) NSString *shopType;
@property (nonatomic, copy) NSNumber *shopLogitude;
@property (nonatomic, copy) NSDate *shopTime;
@property (nonatomic, copy) NSString *shopAddress;
@property (nonatomic, copy) NSString *shopPhone;
@property (nonatomic, copy) NSString *shopName;
@property (nonatomic, copy) NSString *shopDesc;
@end

NS_ASSUME_NONNULL_END

