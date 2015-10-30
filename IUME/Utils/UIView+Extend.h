//
//  UIView+Extend.h
//  xiwu
//
//  Created by yzk on 14-7-24.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extend)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGFloat x, y, width, height;
@property (nonatomic, assign) CGFloat left, right, top, bottom;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, readonly) CGPoint boundsCenter;



/**
 *  view快照
 *
 *  @param opaque 是否不透明，YES: 表示快照得到的image不透明，如果快照的view背景色为clear(即透明色)，则image会黑屏。其他正常
                             NO: 表示快照得到的image透明，如果快照的view背景色为clear(即透明色)，则image会类似png图片。其他正常
 *
 *  @return 快照的image
 */
- (UIImage *)viewSnapshot;    //defalt opaque is YES;
- (UIImage *)viewSnapshotWithOpaque:(BOOL)opaque;

/**
 *  给view加一条线
 */
- (UIView *)addLineWithFrame:(CGRect)frame
                   lineColor:(UIColor *)lineColor;
- (UIImageView *)addLineWithFrame:(CGRect)frame
                       imageNamed:(NSString *)imageName;

/**
 *  给view加边框
 */
- (void)addBorder;
- (void)addBorderWithWidth:(CGFloat)borderWidth;
- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color;
- (void)addBorderWithWidth:(CGFloat)borderWidth
                    corner:(CGFloat)corner;
- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
                    corner:(CGFloat)corner;
- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
           roundingCorners:(UIRectCorner)corners
              cornerRadius:(CGFloat)cornerRadius;

/**
 *  返回view所在的viewController
 *
 *  @return viewController
 */
- (UIViewController*)viewController;

- (NSString *)subHierarchy;
- (NSString *)superHierarchy;

/**
 *  根据父视图的类名name，查找父视图
 */
- (UIView *)findSuperViewWithName:(NSString *)name;

/**
 *  根据子视图的类名name，查找子视图
 */
- (UIView *)findSubviewWithName:(NSString *)name;

/**
 *  查找当前视图下的(深度遍历)第一响应者
 */
- (UIView *)findFirstResponderView;


@end

@interface UILabel (getTextHeight)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                      color:(UIColor *)color;

- (double)getTextWidth;
- (double)getTextHeight;

- (double)getAttributedTextWidthWithAttributes:(NSDictionary *)attributes;
- (double)getAttributedTextHeightWithAttributes:(NSDictionary *)attributes;

@end


@interface UIButton (Extend)

/**
 *  为button设置title,state为UIControlStateNormal,UIControlStateDisabled
 *
 *  @param title button标题
 */
- (void)setTitle:(NSString *)title;

/**
 *  返回button的title,state为UIControlStateNormal
 *
 *  @return title
 */
- (NSString *)title;

/**
 *  为button设置titleColor
 *
 *  @param color 要设置的color
 */
- (void)setTitleColor:(UIColor *)color;

/**
 *  为button添加事件，state为UIControlEventTouchUpInside
 *
 *  @param target 目标
 *  @param action 事件
 */
- (void)addTarget:(id)target action:(SEL)action;

@end


@interface UIScrollView (AutoContentSize)

/**
 *  根据scrollView的subView，自动计算contentSize
 *
 */
- (void)autoContentSize;

/**
 *  根据scrollView的subView，自动计算contentSize
 *
 *  @param space  底部预留的空白
 */
- (void)autoContentSizeWithSpace:(float)space;

@end
