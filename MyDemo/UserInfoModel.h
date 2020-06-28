//
//  UserinfoModel.h
//  MyDemo
//
//  Created by a on 2020/6/28.
//  Copyright © 2020 good. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BaseModel"
NS_ASSUME_NONNULL_BEGIN

@interface UserInfoModel : NSObject<NSCoding>
//    属性,用 setValue
@property NSInteger   UserID;
@property NSString   *UserName;
@property NSString   *UserPassword;
@property NSString   *phone;
@property NSString   *profile;                                //头像 url
@property NSString   *position;                            //职位
@property NSString   *department;                    //部门
//    单例
+   (instancetype)   shareInstance;
//    检查登录状态
- (BOOL)   checkLogin;
//    退出登录
-   (void)   logout;
//    保存模型
-(void)saveToFile;
@end

NS_ASSUME_NONNULL_END
