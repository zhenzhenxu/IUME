//
//  AppStartView.h
//  GeorgeBaseProject
//
//  Created by George on 15/3/20.
//  Copyright (c) 2015年 george. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppStartView : UIView
+(instancetype)startViewWithUrl:(NSURL*)url;
- (void)startAnimationWithCompletionBlock:(void(^)(AppStartView *appStartView))completionHandler;
@end
