//
//  Macro.h
//  FangshangTourism
//
//  Created by wendy on 15/7/28.
//  Copyright (c) 2015年 wendy. All rights reserved.
//

#ifndef FangshangTourism_Macro_h
#define FangshangTourism_Macro_h

#define SuppressPerformSelectorLeakWarning(Stuff)                           \
    do {                                                                    \
        _Pragma("clang diagnostic push")                                    \
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
        Stuff;                                                              \
        _Pragma("clang diagnostic pop")                                     \
    } while (0)

#define IsIOS7              ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define IsIOS8              ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)

#define IsIPHONE5           (([UIScreen mainScreen].bounds.size.height == 568) ? YES : NO)
#define IsIPHONE6           (([UIScreen mainScreen].bounds.size.width == 375) ? YES : NO)
#define IsIPHONE6P          (([UIScreen mainScreen].bounds.size.width == 414) ? YES : NO)

#define LOADIMAGE(file, type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:type]]

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


#import "KeyConfig.h"

#import "FrameConfig.h"
#import "ColorConfig.h"
#import "NetworkConfig.h"

//单例
#import "AppDelegate.h"
#import "SingleInstance.h"
//工具类
#import "Utils.h"
#import "AFNHttpRequest.h"
// 字典转模型
#import "MJExtension.h"
#import "Masonry.h"

#import "UIBarButtonItem+UMBarButtonItem.h"
#import "UITableView+UMTableView.h"

#endif /* ifndef FangshangTourism_Macro_h */
