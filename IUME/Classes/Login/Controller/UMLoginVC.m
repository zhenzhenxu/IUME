//
//  UMLoginVC.m
//  IUME
//
//  Created by Crystal on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMLoginVC.h"
#import "UMLoginView.h"
#import "UMRegisterVC.h"
#import "UMDownLoadResumeVC.h"
#import "UMLoginMD.h"

@interface UMLoginVC ()<loginViewDelegate>
{
    UIScrollView *_scrollView;
    UMLoginView *_loginView;
}

@end

@implementation UMLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    self.title = @"登录";
    
}

- (void)configUI
{
    _scrollView = [UIScrollView new];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    

    _loginView = [[[NSBundle mainBundle]loadNibNamed:@"UMLoginView" owner:nil options:nil]lastObject];

    [_scrollView addSubview:_loginView];
    
    
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_scrollView.mas_width);
        make.height.equalTo(@600);
    }];
    _loginView.delegate = self;
}
#pragma mark loginViewDelegate
- (void)loginViewBtnClick:(UIButton *)btn phoneNum:(NSString *)phoneNum password:(NSString *)password{
    switch (btn.tag) {
        case 11://登录
            if (btn.selected == YES) {
                return;
            }
            [self loginToHomeWithphoneNum:phoneNum password:password btn:btn];
            break;
        case 12:// 忘记密码
            
            break;
        case 13:// 注册
            [self regeist];
            
            break;
            
        default:
            break;
    }

}


- (void)loginToHomeWithphoneNum:(NSString *)phoneNum password:(NSString *)password btn:(UIButton *)sender{
    sender.selected = YES;
    NSDictionary *param = @{
                            KPhone: phoneNum, KPassword: password
                            };
    [AFNHttpRequest afnHttpRequestUrl:kInterfaceLogin
                                param:param
                              success:^(id responseObject) {
                                  UMDownLoadResumeVC *resumeVC = [[UMDownLoadResumeVC alloc]init];
                                  [self.navigationController pushViewController:resumeVC animated:YES];
                                  sender.selected = NO;
                                  
                              }
                              failure:^(NSError *error) {
                                  sender.selected = NO;
                                  [UIHelper hideHUDForView:self.parentViewController.view];
                                  [UIHelper alertWithMsg:@"网络连接失败"];
                                  
                                  
                              }];

}

- (void)regeist{
    UMRegisterVC *registVC = [[UMRegisterVC alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];

}
@end
