//
//  UIBarButtonItem+UMBarButtonItem.h
//  IUME
//
//  Created by 珍 on 15/11/1.
//  Copyright © 2015年 UME. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (UMBarButtonItem)
/**
 *根据图片快速创建一个UIBarButtonItem，自定义大小
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height;

+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;


@end
