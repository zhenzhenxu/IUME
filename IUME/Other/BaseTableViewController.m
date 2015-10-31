//
//  BaseTableViewController.m
//  RongChuang
//
//  Created by yzk on 15/4/8.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "BaseTableViewController.h"

@implementation BaseTableViewController
@synthesize tableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // 去掉导航栏底部的黑线
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = KBlueBarTintColor;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:20], NSFontAttributeName, nil]];

    tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark --返回事件
//- (void)backEvent:(UIBarButtonItem *)paramItem
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}


@end
