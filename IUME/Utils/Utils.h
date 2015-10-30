//
//  Utils.h
//  xiwu
//
//  Created by yzk on 14-7-24.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIView+Extend.h"
#import "UIHelper.h"
#import "UIColor+Hexadecimal.h"
#import "NSString+Extend.h"
#import "NSString+PinYin.h"
#import "NSDate+Format.h"
#import "UIImage+Extend.h"
#import "CategorySysClass.h"
#import "CodeTableManager.h"


@interface Utils : NSObject

/**
 *  获取当前设备的设备号（即唯一标识符）
 *
 *  @return 唯一标示符
 */
+ (NSString *)equipment;

/**
 *  判断设备型号
 *
 *  @return 设备型号
 */
+ (NSString *)deviceString;

#pragma mark - dataString

+ (NSString *)dataByteString:(NSData *)data;

#pragma mark - cache

+ (NSString *)getCachePath;

+ (void)saveFile:(NSString *)dir name:(NSString *)name data:(NSData *)data;

+ (NSData *)readFile:(NSString *)dir name:(NSString *)name;

+ (void)saveModuleVersion:(NSDictionary *)dict forKey:(NSString*)moduleVersionKey;

+ (NSDictionary *)readModuleVersionWithKey:(NSString *)moduleVersionKey;

+ (void)clearModuleVersion;

#pragma mark - document

+ (NSString *)getDocumentPath;

+ (BOOL)saveToDocumentWithFileName:(NSString *)fileName dict:(NSDictionary *)dict;

+ (NSDictionary *)readFromDocumentWithFileName:(NSString *)fileName;

+ (BOOL)deleteFromDocumentWithFileName:(NSString *)fileName;

#pragma mark - NSUserDefault

/**
 *  存储object到NSUserDefault
 *
 *  @param value 值-object
 *  @param key   键-key
 */
+ (void)UDsetObject:(id)value key:(NSString *)key;

/**
 *  从NSUserDefault读取object
 *
 *  @param key object对应的key
 *
 *  @return object
 */
+ (id)UDgetObjectForKey:(id)key;

/**
 *  从NSUserDefault删除键值为key的键值对
 *
 *  @param key 键值
 */
+ (void)UDremoveObjectForKey:(NSString *)key;


#pragma mark - verifyIdentity

/**
 *  验证身份证是否合法
 *
 *  @param idcard 身份证
 *
 *  @return YES or NO
 */
+ (BOOL)verifyIdentity:(NSString*)idcard;

/**
 *  验证手机号是否合法
 *
 *  @param mobile 手机号
 *
 *  @return YES or NO
 */
+ (BOOL)verifyMobile:(NSString *)mobile;

/**
 *  验证邮箱是否合法
 *
 *  @param email 邮箱
 *
 *  @return YES or NO
 */
+ (BOOL)verifyEmail:(NSString *)email;

@end
