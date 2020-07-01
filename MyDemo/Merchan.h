//
//  Merchan.h
//  MyDemo
//
//  Created by a on 2020/6/28.
//  Copyright © 2020 good. All rights reserved.
//

#ifndef Merchan_h
#define Merchan_h
#define  ZJFblue                  [UIColor colorWithRed:0 / 255.0  green:167 / 255.0  blue:255 / 255.0 alpha:1.0]
#define  ZJFgray                  [UIColor colorWithRed:51 / 255.0  green:51 / 255.0  blue:51 / 255.0 alpha:1.0]
//屏幕尺寸定义和 iPhoneX 机型判断代码
#define  YFScreen                 [UIScreen  mainScreen].bounds.size
#define  SCREEN_WIDTH             [UIScreen  mainScreen].bounds.size.width
#define  SCREEN_HEIGHT            [UIScreen  mainScreen].bounds.size.height
#define  IS_IPHONEX               (SCREEN_HEIGHT  ==  812.f)
//判断是否是 ipad
#define  isiPad                   ([[UIDevice  currentDevice]  userInterfaceIdiom]  ==  UIUserInterfaceIdiomPad)IS_IPHONE_Xs ==  YES  ||  IS_IPHONE_Xs_Max ==  YES) ? 44.0 : 20.0)
#define  Height_NavBar            ((IS_IPHONE_X == YES  ||  IS_IPHONE_Xr  == YES  || IS_IPHONE_Xs ==  YES  ||  IS_IPHONE_Xs_Max ==  YES) ? 88.0 : 64.0)
#define  Height_TabBar            ((IS_IPHONE_X == YES  ||  IS_IPHONE_Xr  == YES  || IS_IPHONE_Xs ==  YES  ||  IS_IPHONE_Xs_Max ==  YES) ? 83.0 : 49.0)

#define  BASE_URL                 @"http://172.81.209.165:8080"

#ifdef  DEBUG
//   打印 JSON
#define  ENABLE_JSON_LOG          YES
//   网络请求错误 log
#define  ENABLE_NETWORK_ERROR_LOG YES

#else
//   打印 JSON
#define  ENABLE_JSON_LOG          NO
//   网络请求错误 log
#define  ENABLE_NETWORK_ERROR_LOG NO
#endif
/*对以上宏定义进行解释：
   1.BASE_URL：定义请求的基地址。
   2.ENABLE_JSON_LOG：打印网络请求获得的 JSON 串
   3.ENABLE_NETWORK_ERROR_LOG：打印网络请求发生的错误。
以上宏定义代码对当前的编译环境进了判断，如果当前是 DEBUG 环境，则开启
JSON 打印和网络错误日志，否则关闭两者打印。*/

#endif /* Merchan_h */
