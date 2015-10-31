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
- (void)requestResume{
    NSDictionary *param = @{
                            KPage:@"1"
                            };
    [AFNHttpRequest afnHttpRequestUrl:KInterfaceSearchApp param:param success:^(id responseObject) {
        _dataArray = [UMResumeMD objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
       [UIHelper alertWithMsg:@"网络连接失败"];
    }];



}
@end
