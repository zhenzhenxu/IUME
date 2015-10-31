//
//  UMRegisterView.h
//  IUME
//
//  Created by 珍 on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UMRegisterView;
@protocol registerViewDelegate <NSObject>

- (void)registerViewBtnClick:(UIButton *)btn;

@end
@interface UMRegisterView : UIView
@property (nonatomic, weak) id<registerViewDelegate> delegate;
@end
