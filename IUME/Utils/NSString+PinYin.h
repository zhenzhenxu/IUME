//
//  NSString+PinYin.h
//  RongChuang
//
//  Created by yzk on 15/5/22.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PinYin)

/**
 *  得到字符串的拼音
 *
 *  @return 字符串拼音
 */
- (NSString *)pinyin;

/**
 *  得到字符串首的字母
 *
 *  @return 如果字符串为空等情况返回'#'，否则返回首字母大写
 */
- (NSString *)sortSectionTitle;

@end
