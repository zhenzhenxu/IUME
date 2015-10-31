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
- (void)loginViewBtnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 11://登录
            [self loginToHome];
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


- (void)loginToHome{
    NSDictionary *param = @{
                            @"phone": @"15655248882", @"password": @"123456"
                            };
    [AFNHttpRequest afnHttpRequestUrl:kInterfaceLogin
                                param:param
                              success:^(id responseObject) {
                                  
                                  NSLog(@"请求成功---%@", responseObject);
                                  
                              }
                              failure:^(NSError *error) {
                                 
                              }];





}

- (void)regeist{
    UMRegisterVC *registVC = [[UMRegisterVC alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];

}
@end
