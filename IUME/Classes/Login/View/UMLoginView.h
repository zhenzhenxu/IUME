//
//  UMLoginView.h
//  IUME
//
//  Created by Crystal on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UMLoginView;
@protocol loginViewDelegate <NSObject>

- (void)loginViewBtnClick:(UIButton *)btn phoneNum:(NSString *)phoneNum password:(NSString *)password;

@end
@interface UMLoginView : UIView
@property (nonatomic, weak) id<loginViewDelegate> delegate;

@end
