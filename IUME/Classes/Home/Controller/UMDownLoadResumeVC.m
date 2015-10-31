//
//  UMDownLoadResumeVC.m
//  IUME
//
//  Created by 珍 on 15/10/31.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMDownLoadResumeVC.h"
#import "UMSelectView.h"
#import "UMResumeCell.h"
#import "UMResumeMD.h"
#import "MJExtension.h"
#import "MJRefresh.h"
@interface UMDownLoadResumeVC()
{
    UISearchBar *_searchBar;
    UIView *containerView;
    NSMutableArray *_dataArray;
}
@end
@implementation UMDownLoadResumeVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestResume];

}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"下载简历";
    //下啦刷新
    [self setRefreshIntableView];
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    self.tableView.tableHeaderView = _searchBar;
    _searchBar.placeholder = @"请输入职位关键词";
    

}
#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *resumeID = @"resumeID";
    UMResumeCell *cell = [tableView dequeueReusableCellWithIdentifier:resumeID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"UMResumeCell" owner:nil options:nil]lastObject];
    }
    cell.cellModel = _dataArray[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UMSelectView *view = [[[NSBundle mainBundle]loadNibNamed:@"UMSelectView" owner:nil options:nil]lastObject];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return 40;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 83;
}

#pragma mark - 设置下啦刷新
- (void)setRefreshIntableView{
    //设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; ++i) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd",i]];
        [idleImages addObject:image];
    }
    
    //设置即将刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd",i]];
        [refreshingImages addObject:image];
    }

    //
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestResume)];
    // 设置普通状态的动画图片
    [header setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.tableView.header = header;
    [self.tableView.header beginRefreshing];
    
    
}
- (void)requestResume{
    NSDictionary *param = @{
                            KPage:@"1"
                            };
    [AFNHttpRequest afnHttpRequestUrl:KInterfaceSearchApp param:param success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        [_dataArray removeAllObjects];
        _dataArray = [UMResumeMD objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    } failure:^(NSError *error) {
      [self.tableView.header endRefreshing];
       [UIHelper alertWithMsg:@"网络连接失败"];
        
    }];



}
@end
