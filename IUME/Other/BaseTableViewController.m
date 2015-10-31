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
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.navigationController.navigationBarHidden = NO;
//    self.navigationController.navigationBar.barTintColor = KBlueBarTintColor;
//
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:20], NSFontAttributeName, nil]];
////    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_circle_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(backEvent:)];
//
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回按钮-默认状态" hltImage:@"返回按钮-交互状态" target:self action:@selector(backEvent:) title:nil];
//
////    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
//
//    self.view.backgroundColor = [UIColor colorWithHexString:@"#edeeef"];
//    self.clearsSelectionOnViewWillAppear = YES;
//
//    if (IsIOS7) {
//        self.edgesForExtendedLayout                         = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars               = NO;
//        self.modalPresentationCapturesStatusBarAppearance   = NO;
//        self.navigationController.navigationBar.translucent = NO;
//        self.automaticallyAdjustsScrollViewInsets           = NO;
//    }
    
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
