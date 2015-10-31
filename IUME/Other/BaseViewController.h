//
//  CommonViewController.h
//  RongChuang
//
//  Created by 叶落风逝 on 15/3/23.
//  Copyright (c) 2015年 pinksun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, retain) UIControl *endEditControl;
@property (nonatomic, retain) NSString *idTag;
@property (copy, nonatomic) void (^action)();
//后退按钮点击事件，如需要修改，可重写
- (void)backEvent:(UIBarButtonItem *)paramItem;

// 添加右侧导航按钮
- (void)addRightBarButtonWith:(NSString *)title action:(SEL)action imageName:(NSString *)imageName;

- (void)setNavTitle:(NSString *)title;

- (void)setTitleView:(NSString *)title actionBlock:(void(^)(void))actionBlock;
@end
