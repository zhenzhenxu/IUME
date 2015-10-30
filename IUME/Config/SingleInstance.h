//
//  SingleInstance.h
//  FangshangTourism
//
//  Created by wendy on 15/8/23.
//  Copyright (c) 2015年 wendy. All rights reserved.
//

#ifndef FangshangTourism_SingleInstance_h
#define FangshangTourism_SingleInstance_h

/*
   专门用来保存单例代码
   最后一行不要加 \
 */

// @interface
#define singleton_interface(className) \
    + (className *)shared ## className;


// @implementation
#define singleton_implementation(className)         \
    static className * _instance;                   \
    + (id)allocWithZone:(NSZone *)zone              \
    {                                               \
        static dispatch_once_t onceToken;           \
        dispatch_once(&onceToken, ^{                \
            _instance = [super allocWithZone:zone]; \
        });                                         \
        return _instance;                           \
    }                                               \
    + (className *)shared ## className              \
    {                                               \
        static dispatch_once_t onceToken;           \
        dispatch_once(&onceToken, ^{                \
            _instance = [[self alloc] init];        \
        });                                         \
        return _instance;                           \
    }

#endif /* ifndef FangshangTourism_SingleInstance_h */
