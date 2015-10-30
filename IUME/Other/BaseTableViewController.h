//
//  BaseTableViewController.h
//  RongChuang
//
//  Created by yzk on 15/4/8.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface BaseTableViewController :BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
//后退按钮点击事件，如需要修改，可重写
//- (void)backEvent:(UIBarButtonItem *)paramItem;

@end
