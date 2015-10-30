//
//  UIImage+Extend.h
//  xiwu
//
//  Created by yzk on 14-10-15.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)

#pragma mark - handle image

/**
 *  用颜色生成图片
 *
 *  @param color 生成图片的颜色
 *
 *  @return 该颜色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  处理图片的转向问题
 *
 *  @return 转向后图片
 */
- (UIImage *)rotateImage;

/**
 *  压缩图片
 *
 *  @param defineWidth 目标宽度
 *
 *  @return 压缩后图片
 */
- (UIImage *)imageCompressForTargetWidth:(CGFloat)defineWidth;

/**
 *  等比压缩图片到640
 *
 *  @param image 需要压缩的图片
 *
 *  @return 压缩后图片
 */
+ (UIImage *)compressImageWith:(UIImage *)image;

@end


@interface UIImage (ImageEffects)

- (UIImage *)applySubtleEffect;
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end