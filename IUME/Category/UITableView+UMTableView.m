//
//  UITableView+UMTableView.m
//  IUME
//
//  Created by 珍 on 15/11/1.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UITableView+UMTableView.h"

@implementation UITableView (UMTableView)
+ (UITableView *)initWithTableView:(CGRect)frame withDelegate:(id)delegate
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    //将系统的Separator左边不留间隙
    tableView.separatorInset = UIEdgeInsetsZero;
    return tableView;
}

@end
