//
//  UITableView+UMTableView.h
//  IUME
//
//  Created by 珍 on 15/11/1.
//  Copyright © 2015年 UME. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (UMTableView)
/**
 *  快速创建tableView
 *
 *  @param frame    tableView的frame
 *  @param delegate 代理
 *
 *  @return 返回一个自定义的tableView
 */
+ (UITableView *)initWithTableView:(CGRect)frame withDelegate:(id)delegate;
@end
