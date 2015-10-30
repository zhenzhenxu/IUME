//
//  NSString+Extend.h
//  PatDog
//
//  Created by yzk on 14-8-12.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)

- (NSString *)md5;

/**
 *  判断字符串是否==nil或者为[self length]==0
 *
 *  @return bool值
 */
- (BOOL)isLegal;

/**
 *  判断字符串去除空格符和回车符后，是否==nil或者为[self length]==0
 *
 *  @return bool值
 */
- (BOOL)isLegalTrimmingWhitespace:(BOOL)isTrim;

/**
 *  保留首尾字符，其他字符转换成*
 *
 *  @return bool值
 */
- (NSString *)changeChar;

//- (NSString )

/**
 *  去除字符串中的空格和换行
 *
 *  @return 变换后的字符串
 */
- (NSString *)triming;

/**
 *  判断字符串 中文字符 字母 数字 以及下划线
 *
 *  @return bool值
 */
- (BOOL)isChineseCharacterAndLettersAndNumbersAndUnderScore;

- (double)getTextHeightWithFont:(UIFont *)font width:(CGFloat)width;
- (double)getTextWidthWithFont:(UIFont *)font height:(CGFloat)height;

@end
