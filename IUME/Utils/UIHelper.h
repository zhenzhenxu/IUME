//
//  UIHelper.h
//  xiwu
//
//  Created by yzk on 14-7-21.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIHelper : NSObject

/**
 *  显示UIActivityIndicatorView
 *
 *  @param v 在view中显示
 *
 *  @return 对应的HUD
 */
+ (MBProgressHUD *)showIndicatorToView:(UIView*)v;

/**
 *  显示UIActivityIndicatorView
 *
 *  @param text 显示的文字信息
 *  @param v    在view中显示
 *
 *  @return 对应的HUD
 */
+ (MBProgressHUD *)showIndicatorWithText:(NSString*)text ToView:(UIView*)v;

/**
 *  显示纯文字信息，不是提示框，会自动消失
 *
 *  @param text 显示的文字信息
 *  @param v    在view中显示
 *
 *  @return 对应的HUD
 */
+ (MBProgressHUD *)showText:(NSString*)text ToView:(UIView*)v;

/**
 *  隐藏HUD框
 *
 *  @param v HUD在view中显示
 */
+ (void)hideHUDForView:(UIView *)v;
+ (void)hideSingleHUDForView:(UIView *)view;

/**
 *  显示完成图片及文字信息，1秒后 隐藏HUD框
 *
 *  @param text 显示的文字信息
 *  @param v    HUD在view中显示
 */
+ (void)hideHUDWithCompletedText:(NSString *)text forView:(UIView *)v;

/**
 *  弹出提示框信息
 *
 *  @param msg 内容
 */
+ (UIAlertView *)alertWithMsg:(NSString*)msg;

/**
 *  弹出提示框信息
 *
 *  @param title 标题
 *  @param msg   内容
 */
+ (UIAlertView *)alertWithTitle:(NSString*)title andMsg:(NSString*)msg;

@end
