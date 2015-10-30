//
//  FrameConfig.h
//  FangshangTourism
//
//  Created by wendy on 15/7/28.
//  Copyright (c) 2015年 wendy. All rights reserved.
//

#ifndef FangshangTourism_FrameConfig_h
#define FangshangTourism_FrameConfig_h

#define YZKRectMake(x, y, w, h) CGRectMake(YZKCalculateX(x), YZKCalculateY(y), YZKCalculateX(w), YZKCalculateY(h))
#define YZKCalculateX(x)        ((x) * IPHONE_WIDTH / APP_WIDTH)
#define YZKCalculateY(y)        ((y) * IPHONE_WIDTH / APP_WIDTH)
#define YZKRecoverX(x)          ((x) * APP_WIDTH / IPHONE_WIDTH)
#define YZKRecoverY(y)          ((y) * APP_WIDTH / IPHONE_WIDTH)

#define IPHONE_WIDTH         [UIScreen mainScreen].bounds.size.width  //屏幕宽度
#define IPHONE_HEIGHT        [UIScreen mainScreen].bounds.size.height  //屏幕高度

#define APP_HEIGHT           (IPHONE_HEIGHT >= 568.0 ? 568.0 : 480.0)
#define APP_WIDTH            320.0

#define APP_STATUSBAR_HEIGHT 20
#define APP_NAVI_HEIGHT      64
#define APP_TABBAR_HEIGHT    49


#endif
