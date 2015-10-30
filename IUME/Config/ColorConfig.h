//
//  ColorConfig.h
//  FangshangTourism
//
//  Created by wendy on 15/7/28.
//  Copyright (c) 2015年 wendy. All rights reserved.
//

#ifndef FangshangTourism_ColorConfig_h
#define FangshangTourism_ColorConfig_h

#define kGrayTextColor        [UIColor colorWithHex:0x8c8c8c]
#define kDarkGrayTextColor    [UIColor colorWithWhite:0 alpha:0.9]
#define kGrayLineColor        [UIColor colorWithHex:0xeeeeee]

#define RGBA(r, g, b, a) [UIColor colorWithRed: (r) / 255.0f green: (g) / 255.0f blue: (b) / 255.0f alpha: a]
#define RGB(r, g, b)     RGBA(r, g, b, 1.0f)

#define kNavBarBackgroudColor RGB(31, 140, 39)
///navigationBar
#define kOrangeBarTintColor   [UIColor colorWithHex:0xe95412]
#define kGrayBarTintColor     [UIColor colorWithHex:0xedeeef]
#define KBlueBarTintColor     [UIColor colorWithHexString:@"#ffffff"]

#endif
