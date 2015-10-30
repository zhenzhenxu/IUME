//
//  CodeTableManager.h
//  PatDog
//
//  Created by yzk on 14-8-29.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  码表管理类
 
 码表一般结构如下:
 {
     "key":[
         {"code":"value"}
     ],
     "gender":[
         {"0":"男"},
         {"1":"女"}
     ],
     "category":[
         {"0":"汪星人"},
         {"1":"喵星人"},
         {"2":"其他"}
     ],
     "petGender":[
         {"0":"男孩"},
         {"1":"女孩"}
     ],
     "memberLevel":[
         {"COMMON":"普通会员"},
         {"VIP":"VIP会员"}
     ]
 }
 */



@interface CodeTableManager : NSObject

/**
 *  获取默认file文件(basic_code_table.json)中，typekey码表内，code对应的码值
 *
 *  @see getValueWithTypeKey:code:codeTableFile:
 */
+ (NSString *)getValueWithTypeKey:(NSString *)typekey code:(NSString *)code;

/**
 *  获取file文件中，typekey码表内，code对应的码值
 *
 *  @param typekey 码表的key
 *  @param code    码值的key
 *  @param file    存储码表的文件
 *
 *  @return 码值
 */
+ (NSString *)getValueWithTypeKey:(NSString *)typekey code:(NSString *)code codeTableFile:(NSString *)fileName;

/**
 *  获取默认file文件(basic_code_table.json)中，typekey码表内，value对应的码code
 *
 *  @see getCodeWithTypeKey:value:codeTableFile:
 */
+ (NSString *)getCodeWithTypeKey:(NSString *)typekey value:(NSString *)value;

/**
 *  获取file文件中，typekey码表内，value对应的码code
 *
 *  @param typekey 码表的key
 *  @param value   码值的key
 *  @param file    存储码表的文件
 *
 *  @return 码code
 */
+ (NSString *)getCodeWithTypeKey:(NSString *)typekey value:(NSString *)value codeTableFile:(NSString *)fileName;

/**
 *  获取默认file文件(basic_code_table.json)中，typekey码表的value码值数组
 *
 *  @see getValueArrayWithTypeKey:codeTableFile:
 */
+ (NSArray *)getValueArrayWithTypeKey:(NSString *)typekey;

/**
 *  获取file文件中，typekey码表的value码值数组
 *
 *  @param typekey 码表的key
 *  @param file    存储码表的文件
 *
 *  @return value码值数组
 */
+ (NSArray *)getValueArrayWithTypeKey:(NSString *)typekey codeTableFile:(NSString *)fileName;

/**
 *  获取默认file文件(basic_code_table.json)中，typekey码表的code码数组
 *
 *  @see getCodeArrayWithTypeKey:codeTableFile:
 */
+ (NSArray *)getCodeArrayWithTypeKey:(NSString *)typekey;

/**
 *  获取file文件中，typekey码表的code码数组
 *
 *  @param typekey 码表的key
 *  @param file    存储码表的文件
 *
 *  @return code码数组
 */
+ (NSArray *)getCodeArrayWithTypeKey:(NSString *)typekey codeTableFile:(NSString *)fileName;

@end
