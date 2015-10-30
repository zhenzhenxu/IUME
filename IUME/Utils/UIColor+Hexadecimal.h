//
//  UIColor+Hexadecimal.h
//  xiwu
//
//  Created by yzk on 14-7-21.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <UIKit/UIKit.h>


#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface UIColor (Hexadecimal)

+ (UIColor *)colorWithHex:(NSInteger)hex;
+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)str;

@end
