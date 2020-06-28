//
//  NetworkTool.h
//  MyDemo
//
//  Created by a on 2020/6/28.
//  Copyright © 2020 good. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

//  请求类型
typedef enum {
    GETType = 1,
    POSTType=2
}MethodType;
typedef void (^SuccessBlock)(NSDictionary *respondDictionary);
typedef void (^FailureBlock)(NSError *error);

@interface NetworkTool : AFHTTPSessionManager

+(instancetype)shareInstance;
//  请求 HTTP 方法
-(void)requireMethodType:(MethodType)type
URLString:(NSString *)urlString
parameters:(NSDictionary *)parameters
success:(SuccessBlock)success
failure : (FailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
